import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import '../locator.dart';
import 'base_model.dart';

class TrainerPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  String email1 = '12345';
  String password1 = '1234567890';

  Future login({
    @required String email,
    @required String password,
  }) async {
    if (email == email1 && password == password1) {
      _navigationService.navigateTo(TrainerHomePageViewRoute);
    } else if (email.isEmpty && password.isEmpty) {
      await _dialogService.showDialog(
        title: 'Given field is empty ',
        description: 'Please enter your request id',
      );
    } else {
      await _dialogService.showDialog(
        title: 'Request Id error',
        description: 'Please re-enter your request id',
      );
    }
    void navigateToTrainerHomePage() {
      _navigationService.navigateTo(TrainerHomePageViewRoute);
    }
  }
}
