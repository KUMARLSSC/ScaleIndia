import 'package:Scaleindia/Services/api_services.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/background_fetch_service.dart';
import 'package:Scaleindia/Services/candidate_service.dart';
import 'package:Scaleindia/Services/cloudStorage_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/firestore_service.dart';
import 'package:Scaleindia/Services/location_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/practical_services.dart';
import 'package:Scaleindia/Services/request_service.dart';
import 'package:Scaleindia/Services/theory_service.dart';
import 'package:Scaleindia/shared/image_selector.dart';
import 'package:Scaleindia/shared/resum_selector.dart';
import 'package:get_it/get_it.dart';

import 'Pages/RPL-4Candidate/video_selector.dart';
import 'Services/employee_cloud_storage.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => RequestService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CandidateService());
  locator.registerLazySingleton(() => TheoryService());
  locator.registerLazySingleton(() => PracticalService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => BackgroundFetchService());
  locator.registerLazySingleton(() => CloudStorageService());
  locator.registerLazySingleton(() => EmployeeCloudStorageService());
  locator.registerLazySingleton(() => ImageSelector());
  locator.registerLazySingleton(() => VideoSelector());
  locator.registerLazySingleton(() => ResumeSelector());
}
