import 'package:motopay_assessment_test/src/app/presentations/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
  ],
  logger: StackedLogger(),
)
class AppSetup {}
