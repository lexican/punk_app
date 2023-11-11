import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_image/punk_image.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';
import 'package:motopay_assessment_test/src/core/utils/app_utils.dart';
import 'package:motopay_assessment_test/src/core/utils/string_utils.dart';

class PunkItem extends StatelessWidget {
  final Punk punk;
  const PunkItem({super.key, required this.punk});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GestureDetector(
        child: Column(
          children: [
            PunkImage(
              imageUrl: punk.imageUrl ?? '',
              imageHeight: 104,
              imageWidth: double.infinity,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 9,
                  right: 9,
                  top: 9,
                  bottom: 10,
                ),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(4),
                    bottomRight: Radius.circular(4),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PunkText.b1(
                      content: convertToIdHash(punk.id ?? 0),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    PunkText.b1(
                      content: punk.name.toString().capitalize(),
                      color: Colors.black.withOpacity(0.87),
                      fontSize: 14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}