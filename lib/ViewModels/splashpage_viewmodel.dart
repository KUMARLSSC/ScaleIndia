import 'dart:async';

import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../locator.dart';
import 'base_model.dart';

class SplashPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    Future.delayed(Duration(seconds: 3),
        () => _navigationService.navigateTo(OnBoardingPageViewRoute));
  }

  Future onBoardLogic() async {
    final prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      _navigationService.navigateTo(OnBoardingPageViewRoute);
    } else {
      prefs.setBool('seen', true);
     _navigationService.navigateTo(HomeViewRoute);
    }
  }
}
