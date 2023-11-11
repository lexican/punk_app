import 'package:motopay_assessment_test/src/core/api/api_client.dart';
import 'package:motopay_assessment_test/src/features/app/presentations/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiClient)
  ],
  logger: StackedLogger(),
)
class AppSetup {}
