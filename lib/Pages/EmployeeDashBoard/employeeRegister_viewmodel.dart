import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/ViewModels/base_model.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';

class EmployeeViewModel extends BaseModel{
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

String _selectedGender = 'Select a Gender';
  String get selectedRole => _selectedGender;
  

  void setSelectedRole(dynamic gender) {
    _selectedGender = gender;
    notifyListeners();
  }
  Future signUp({
     @required String address,
    @required String employeeEmailAddress,
    @required String password,
    @required String name,
    @required String motherName,
    @required String fatherName,
    @required String phoneNumber,
    @required String alternatePhoneNumber,
    @required String city,
    @required String pincode,
    @required String state,
    @required String educationalQualification,
    @required String lastCompanyWorkedFor,
    @required String lastWorkingDesignation,
    @required String dateOfBirth,
    @required String gender,
    @required String aadharNumber,
    @required String workExperiance,
  }) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmailEmployee(
     employeeEmailAddress:employeeEmailAddress,name: name,motherName: motherName,address: address,
          fatherName: fatherName,dateOfBirth: dateOfBirth,city: city,gender: _selectedGender,
          phoneNumber: phoneNumber,aadharNumber: aadharNumber,alternatePhoneNumber: alternatePhoneNumber,
          lastCompanyWorkedFor: lastCompanyWorkedFor,lastWorkingDesignation: lastWorkingDesignation,workExperiance: workExperiance,
          educationalQualification: educationalQualification,pincode: pincode,state: state, password: password
    );

    setBusy(false);

    if (result is bool) {
      if (result) {
        _navigationService.navigateTo(EmployeeDashBoardViewRoute);
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