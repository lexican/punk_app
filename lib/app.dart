import 'package:flutter/material.dart';
import 'package:motopay_assessment_test/src/core/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xFF3558CD),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        //fontFamily: FontFamily.notoSans,
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 24,
            color: Color(0xFF161A33),
            fontWeight: FontWeight.w700,
          ),
          bodyLarge: TextStyle(
            fontSize: 12,
            color: Color(0xFF6B6B6B),
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
