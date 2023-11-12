import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';

class FoodPairing extends StatelessWidget {
  final List<String> foodpairingList;
  const FoodPairing({super.key, required this.foodpairingList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PunkText.h1(
          content: "Food Pairing",
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        const SizedBox(
          height: 12,
        ),
        ...foodpairingList
            .map(
              (foodPairing) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: PunkText.b1(
                  content: '\u2022 $foodPairing',
                  fontSize: 16,
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
