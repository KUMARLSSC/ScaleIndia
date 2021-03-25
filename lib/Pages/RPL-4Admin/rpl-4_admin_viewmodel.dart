import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/ViewModels/base_model.dart';
import 'package:Scaleindia/locator.dart';
import 'package:flutter/foundation.dart';

class RPL4AdminViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  String email1 = '12345';
  String password1 = '1234567890';
  void navigateToRPL4LRegisterPage() {
    _navigationService.navigateTo(RPL4RegisterPageViewRoute);
  }

  Future login({
    @required String email,
    @required String password,
  }) async {
    if (email == email1 && password == password1) {
      _navigationService.navigateTo(RPL4AdminHomePageViewRoute);
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
  }

  void admin() {
    _navigationService.navigateTo(RPL4AdminHomePageViewRoute);
  }

  Future verify({
    @required String phoneNo,
    @required String sms,
  }) async {
    setBusy(true);

    var result =
        _authenticationService.verifyPhone(phoneNo: phoneNo, smsCode: sms);
    setBusy(false);
    if (result is bool) {
      _navigationService.navigateTo(RPL4OTPPageViewRoute);
    }
  }
}
