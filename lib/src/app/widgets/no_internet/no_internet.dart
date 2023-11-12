import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';

class NoInternet extends StatelessWidget {
  final Function retry;
  const NoInternet({super.key, required this.retry});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: PunkText.b1(
            content: "No Internet",
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        TextButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {
            retry();
          },
          child: const Text(
            'Retry',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}
