import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import '../locator.dart';
import 'base_model.dart';

class EmployerPageViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future login({
    @required String email,
    @required String password,
  }) async {
    setBusy(true);

    var result = await _authenticationService.loginWithEmailEmployer(
      companyEmailAddress: email,
      password: password,
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(EmployerDashBoardViewRoute);
      } else {
        await _dialogService.showDialog(
          title: 'Login Failure',
          description: result.toString(),
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Login Failure',
        description: result,
      );
    }
  }

  Future logOut() async {
    await _authenticationService.signOut();
    _navigationService.navigateTo(HomeViewRoute);
  }

  void navigateToEmployerRegister() {
    _navigationService.navigateTo(EmployerRegisterViewRoute);
  }

  void navigateToSourcingView() async {
    _navigationService.navigateTo(SouringPageViewRoute);
  }

  void navigateToForgotPage2() {
    _navigationService.navigateTo(ForgotPage2ViewRoute);
  }

  Future navigateToCsCreateView() async {
    await _navigationService.navigateTo(CompanyCreatePageViewRoute);
  }

  void navigateToCompanySourcingView() async {
    _navigationService.navigateTo(CompanySouringPageViewRoute);
  }

  Future navigateToCsHomeView() async {
    await _navigationService.navigateTo(CompanyHomePageViewRoute);
  }

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
