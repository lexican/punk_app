import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:motopay_assessment_test/src/app/widgets/punk_text.dart';
import 'package:stacked_services/stacked_services.dart';

String convertToIdHash(num id) {
  assert(id >= 0, 'ID should be greater than or equal to 0');
  return "#${'$id'.padLeft(3, '0')}";
}

var logger = Logger(
  printer: PrettyPrinter(
      methodCount: 2, // number of method calls to be displayed
      errorMethodCount: 8, // number of method calls if stacktrace is provided
      lineLength: 120, // width of the output
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
      printTime: false // Should each log print contain a timestamp
      ),
);

void showSnackBar(String message, Color backgroundColor) {
  ScaffoldMessenger.of(StackedService.navigatorKey!.currentContext!)
      .showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Center(
        child: PunkText.b1(
          content: message,
          color: Colors.white,
          fontSize: 14,
        ),
      ),
    ),
  );
}
