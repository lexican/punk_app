import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/domain/repositories/repository.dart';
import 'package:motopay_assessment_test/src/app/domain/ues_cases/get_punks_usecase/get_punks_usecase.dart';

import 'use_cases_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  const perPage = 25;
  late Repository mockRepository;
  late GetPunksCase getPunksCase;

  late List<Punk> punks;

  setUp(() {
    mockRepository = MockRepository();
    getPunksCase = GetPunksCase(mockRepository);
    punks = List.generate(perPage, (index) => Punk(id: index));
  });
  group('Use cases tests', () {
    test('Should return a list of punks from repository', () async {
      when(mockRepository.getPunks()).thenAnswer((_) async {
        return Right(punks);
      });
      final data = await getPunksCase.call();

      expect(data, Right(punks));
      expect((data as Right<String, List<Punk>>).value.length, equals(perPage));

      // Verify that the function was called on the repo
      verify(mockRepository.getPunks()).called(1);

      //Verify no other method was called on the repo.
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
