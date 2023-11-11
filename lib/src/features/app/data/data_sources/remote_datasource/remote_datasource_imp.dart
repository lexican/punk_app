import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:motopay_assessment_test/src/core/api/api_client.dart';
import 'package:motopay_assessment_test/src/core/api/exceptions/network_exceptions.dart';
import 'package:motopay_assessment_test/src/core/constants/api_config.dart';
import 'package:motopay_assessment_test/src/features/app/data/data_sources/remote_datasource/remote_datasource.dart';
import 'package:motopay_assessment_test/src/features/app/data/models/punk.dart';

class RemoteDataSourceImp extends RemoteDataSource {
  late ApiClient _apiClient;
  RemoteDataSourceImp({required ApiClient apiClient}) {
    _apiClient = apiClient;
  }
  @override
  Future<Either<String, List<Punk>>> getPunks(
      {int? page = 1, int? perPage = 25}) async {
    try {
      final response = await _apiClient.get(
        ApiConfig.punksPath,
        parameters: {
          'page': page,
          'per_page': perPage,
        },
      );
      dynamic data = response.data;
      List<Punk> punks = data.map<Punk>((punk) => Punk.fromMap(punk)).toList();

      return Right(punks);
    } on DioException catch (e) {
      //if (e.response != null) {
      // print(e.response!.data);
      // print(e.response!.headers);
      // print(e.response!.requestOptions);
      //} else {
      // print(e.requestOptions);
      // print(e.message);
      // }
      return Left(NetworkExceptions.fromDioException(e).toString());
    }
  }
}
