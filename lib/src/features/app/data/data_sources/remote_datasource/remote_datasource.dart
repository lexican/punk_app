import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:motopay_assessment_test/src/features/app/data/models/punk.dart';

abstract class RemoteDataSource {
  Future<Either<String, List<Punk>>> getPunks({int? page, int? perPage});
}
