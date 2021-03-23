import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/ViewModels/base_model.dart';
import 'package:Scaleindia/locator.dart';
import 'package:flutter/foundation.dart';

class RPL4ViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  void navigateToRPL4LRegisterPage() {
    _navigationService.navigateTo(RPL4RegisterPageViewRoute);
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
