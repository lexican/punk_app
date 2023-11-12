import 'package:flutter_test/flutter_test.dart';
import 'package:motopay_assessment_test/src/core/utils/app_utils.dart';

void main() {
  group('App utils functions tests', () {
    test(
        "Should convert a number to a string prefixed with '#' and leading '0's",
        () {
      expect(convertToIdHash(1), equals("#001"));
    });
  });
}
