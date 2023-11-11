import 'package:motopay_assessment_test/src/app/data/repositories/repository_imp.dart';
import 'package:motopay_assessment_test/src/core/api/api_client.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/data/data_sources/remote_datasource/remote_datasource_imp.dart';

final locator = StackedLocator.instance;
void setupLocator() {
  locator.registerLazySingleton(
    () => RepositoryImp(
      remoteDataSource: RemoteDataSourceImp(apiClient: ApiClient()),
    ),
  );
  locator.registerLazySingleton(() => NavigationService());
}
