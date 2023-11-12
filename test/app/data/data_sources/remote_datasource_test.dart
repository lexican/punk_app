import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motopay_assessment_test/src/app/data/data_sources/remote_datasource/remote_datasource_imp.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/core/api/api_client.dart';
import 'package:motopay_assessment_test/src/core/constants/api_config.dart';

import 'remote_datasource_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  const perPage = 25;
  late MockApiClient mockApiClient;
  late RemoteDataSourceImp remoteDataSourceImp;
  late List<Punk> punks;
  late List<Map<String, dynamic>> punksResponseMap;
  setUp(() {
    mockApiClient = MockApiClient();
    remoteDataSourceImp = RemoteDataSourceImp(apiClient: mockApiClient);
    punks = List.generate(perPage, (index) => Punk(id: index));
    punksResponseMap = List.generate(perPage, (index) => {'id': index});
  });
  group('Remote data source tests', () {
    test('Should return punks', () async {
      when(mockApiClient.get(
        ApiConfig.punksPath,
        parameters: {
          'page': 1,
          'per_page': perPage,
        },
      )).thenAnswer((_) async {
        return Response(
          data: punksResponseMap,
          requestOptions: RequestOptions(path: ''),
        );
      });

      final result = await remoteDataSourceImp.getPunks(page: 1);

      result.fold((l) => null, (r) {
        expect(r.length, perPage);
        expect(r, punks);
      });

      verify(
        mockApiClient.get(
          ApiConfig.punksPath,
          parameters: {
            'page': 1,
            'per_page': perPage,
          },
        ),
      ).called(1);
    });
  });
}
