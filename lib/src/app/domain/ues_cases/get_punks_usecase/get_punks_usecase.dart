import 'package:dartz/dartz.dart';
import 'package:motopay_assessment_test/src/app/domain/ues_cases/api_base_usecase.dart';

import '../../../data/models/punk.dart';
import '../../repositories/repository.dart';

class GetPunksCase extends ApiBaseUseCase<List<Punk>> {
  final Repository _repository;
  GetPunksCase(this._repository);
  @override
  Future<Either<String, List<Punk>>> call({int? page, int? perPage}) =>
      _repository.getPunks(page: page, perPage: perPage);
}
