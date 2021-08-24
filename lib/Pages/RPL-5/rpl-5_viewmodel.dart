import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/ViewModels/base_model.dart';
import 'package:flutter/cupertino.dart';

import '../../locator.dart';

class RPL5ViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final DialogService _dialogService = locator<DialogService>();
  String email1 = 'abc@gmail.com';
  String password1 = 'abc123';
  String email2 = 'xyz@gmail.com';
  String password2 = '123abc';
  String email3 = 'rpl5@gmail.com';
  String password3 = 'abc123';
  String email4 = 'candidate@gmail.com';
  String password4 = '123abc';
  String email5 = 'admin@gmail.com';
  String password5 = 'abc123';

  Future login({
    @required String email,
    @required String password,
  }) async {
    if (email == email1 && password == password1 ||
        email == email2 && password == password2 ||
        email == email3 && password == password3 ||
        email == email4 && password == password4 ||
        email == email5 && password == password5) {
      _navigationService.navigateTo(RPL5AssessmentPage);
    } else if (email.isEmpty && password.isEmpty) {
      await _dialogService.showDialog(
        title: 'Given field is empty ',
        description: 'Please enter your request id',
      );
    } else {
      await _dialogService.showDialog(
        title: 'Login Error',
        description: 'Please check your email and password',
      );
    }
  }
}
