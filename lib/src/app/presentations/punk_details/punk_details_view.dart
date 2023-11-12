// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:motopay_assessment_test/src/app/data/models/punk.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_image/punk_image.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';

import '../../widgets/punk_details/food_pairing/food_pairing.dart';
import '../../widgets/punk_details/punk_details_section/punk_details_section.dart';

class PunkDetailsView extends StatelessWidget {
  final Punk punk;
  const PunkDetailsView({
    Key? key,
    required this.punk,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xff161A33),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.arrow_back_ios_new, size: 20),
        ),
        title: PunkText.h1(
          content: punk.name ?? "",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            PunkImage(
              imageUrl: punk.imageUrl ?? '',
              imageHeight: 140,
              imageWidth: double.infinity,
            ),
            const SizedBox(
              height: 30,
            ),
            PunkDetailsSection(
              title: "Description",
              text: punk.description ?? '',
            ),
            const SizedBox(
              height: 20,
            ),
            PunkDetailsSection(
              title: "Tagline",
              text: punk.tagline ?? '',
            ),
            const SizedBox(
              height: 20,
            ),
            PunkDetailsSection(
              title: "First Brewed",
              text: punk.firstBrewed ?? '',
            ),
            const SizedBox(
              height: 20,
            ),
            PunkDetailsSection(
              title: "Brewers Tips",
              text: punk.brewersTips ?? '',
            ),
            const SizedBox(
              height: 20,
            ),
            FoodPairing(
              foodpairingList: punk.foodPairing ?? [],
            ),
          ],
        ),
      ),
    );
  }
}
