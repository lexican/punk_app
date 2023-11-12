import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_item/punk_item.dart';
import 'package:motopay_assessment_test/src/core/utils/app_utils.dart';

class OnPressedMock extends Mock {
  void call();
}

void main() {
  late Punk punk;
  late OnPressedMock onPressedMock;

  setUp(() {
    onPressedMock = OnPressedMock();
    punk = Punk(
      id: 1,
      name: "Buzz",
      tagline: "A Real Bitter Experience.",
      firstBrewed: "09/2007",
      description:
          "A light, crisp and bitter IPA brewed with English and American hops. A small batch brewed only once.",
      imageUrl: "https://images.punkapi.com/v2/keg.png",
      abv: 4.5,
    );
  });

  group('Should render punk item correctly ', () {
    testWidgets('PunkItem has title and id', (tester) async {
      // Create the widget by telling the tester to build it.
      await tester.pumpWidget(
        MaterialApp(
          home: PunkItem(punk: punk),
        ),
      );
      expect(find.text(punk.name.toString()), findsOneWidget);
      expect(find.text(convertToIdHash(punk.id ?? 0)), findsOneWidget);
    });
  });
}
