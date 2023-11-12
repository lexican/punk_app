import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';

class PunkDetailsSection extends StatelessWidget {
  final String title;
  final String text;
  const PunkDetailsSection(
      {super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PunkText.h1(
          content: title,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        const SizedBox(
          height: 12,
        ),
        PunkText.b1(
          content: text,
          fontSize: 16,
        )
      ],
    );
  }
}
