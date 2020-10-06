import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import '../locator.dart';
import 'base_model.dart';

class ForgotPage2ViewModel extends BaseModel {

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
   final NavigationService _navigationService = locator<NavigationService>();
  
 
  Future<void> forgot({
    @required String email,
  }) async {
    _authenticationService.sendPasswordResetEmail(email: email);
    _dialogService.showDialog(
        title: 'Reset Password',
        description: 'A password reset link has beeen sent to' + email);
  }
   void navigateBackToLogin() {
    _navigationService.navigateTo(EmployerViewRoute);
  }

}