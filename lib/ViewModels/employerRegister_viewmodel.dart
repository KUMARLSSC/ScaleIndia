import 'package:ScaleIndia/Models/route_names.dart';
import 'package:ScaleIndia/Services/authentication_service.dart';
import 'package:ScaleIndia/Services/dialog_service.dart';
import 'package:ScaleIndia/Services/navigation_service.dart';

import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class EmployerViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future signUp({
    @required String companyEmailAddress,
    @required String companyAddress,
    @required String password,
    @required String companyName,
    @required String city,
    @required String companyPhoneNumber,
    @required String pointOfContactNumber,
    @required String pointOfContactName,
    @required String pocEmailAdress,
    @required String pincode,
    @required String state,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmailEmployer(
      city: city,
      companyAddress: companyAddress,
      companyEmailAddress: companyEmailAddress,
      pincode: pincode,
      pointOfContactName: pointOfContactName,
      pointOfContactNumber: pointOfContactNumber,
      state: state,
      companyPhoneNumber: companyPhoneNumber,
      pocEmailAdress: pocEmailAdress,
      companyName: companyName,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(EmployerDashBoardViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
