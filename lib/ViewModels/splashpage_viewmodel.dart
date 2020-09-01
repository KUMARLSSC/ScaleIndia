import 'dart:async';

import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class SplashPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    Future.delayed(
      Duration(seconds: 3),
      () => _navigationService.navigateTo(FirstViewRoute)
    );
  }
}
