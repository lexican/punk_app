import 'package:dartz/dartz.dart';

import 'package:motopay_assessment_test/src/app/data/models/punk.dart';

import '../../domain/repositories/repository.dart';
import '../data_sources/remote_datasource/remote_datasource.dart';

class RepositoryImp extends Repository {
  late RemoteDataSource _remoteDataSource;
  RepositoryImp({required remoteDataSource}) {
    _remoteDataSource = remoteDataSource;
  }
  @override
  Future<Either<String, List<Punk>>> getPunks({int? page, int? perPage}) {
    return _remoteDataSource.getPunks(page: page, perPage: perPage);
  }
}
