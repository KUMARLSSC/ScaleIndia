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
  final DialogService _dialogService = locator<DialogService>();
  String phoneNumber = '1234567890';

  void navigateToRPL4LRegisterPage() {
    _navigationService.navigateTo(RPL4RegisterPageViewRoute);
  }

  Future login({
    @required String phoneNumber1,
  }) async {
    if (phoneNumber1 == phoneNumber) {
      _navigationService.navigateTo(RPL4HomePageViewRoute);
    } else if (phoneNumber1.isEmpty) {
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
