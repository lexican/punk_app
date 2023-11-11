import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: PunkText.h1(
              content: 'PUNK',
              color: Colors.white,
              fontSize: 32,
            ),
          )
        ],
      ),
    );
  }
}
