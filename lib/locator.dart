import 'package:Scaleindia/Services/api_services.dart';
import 'package:Scaleindia/Services/candidate_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/json_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/practical_services.dart';
import 'package:Scaleindia/Services/request_service.dart';
import 'package:Scaleindia/Services/theory_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => JsonService());
  locator.registerLazySingleton(() => RequestService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => CandidateService());
  locator.registerLazySingleton(() => TheoryService());
   locator.registerLazySingleton(() => PracticalService());
}
