import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import '../locator.dart';
import 'base_model.dart';

class EmployeePageViewModel extends BaseModel {

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  
  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmailEmployee(
     employeeEmailAddress: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(EmployeeDashBoardViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: 'General login failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  void navigateToEmployeeRegister() {
    _navigationService.navigateTo(EmployeeRegisterViewRoute);
  }
 void navigateToForgotPage1() {
    _navigationService.navigateTo(ForgotPage1ViewRoute);
  }
 
}
