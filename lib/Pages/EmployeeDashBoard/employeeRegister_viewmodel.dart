import 'dart:io';

import 'package:Scaleindia/ApiModel/employee_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/employee_cloud_storage.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/ViewModels/base_model.dart';
import 'package:Scaleindia/shared/image_selector.dart';
import 'package:Scaleindia/shared/resum_selector.dart';
import 'package:flutter/foundation.dart';

import '../../locator.dart';

class EmployeeViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final ResumeSelector _resumeSelector = locator<ResumeSelector>();
  final EmployeeCloudStorageService _employeecloudStorageService =
      locator<EmployeeCloudStorageService>();
  Employee _employee;

  String _selectedGender = 'Select a Gender';
  String get selectedRole => _selectedGender;
  File _selectedImage;
  File get selectedImage => _selectedImage;
  File _selectedResume;
  File get selectedResume => _selectedResume;
  void setSelectedRole(dynamic gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);
      notifyListeners();
    }
  }

  Future selectResume() async {
    var tempResume = await _resumeSelector.selectResum();
    if (tempResume != null) {
      _selectedResume = File(tempResume.path);
      notifyListeners();
    }
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
    @required String technicalEducation,
    @required String experiencebifurcationwithdesignation,
    @required String lastsalary,
    @required String expectedSalary,
    @required String intrestarea,
    @required String resumeUrl,
    @required String resumeFileName,
    @required String imageUrl,
    @required String imageFileName,
  }) async {
    setBusy(true);
    EmployeeCloudStorageResult storageResult;
    ImagCloudStorageResult imagCloudStorageResult;
    storageResult = await _employeecloudStorageService.uploadImage1(
        resumToUpload: _selectedResume, name: name);
    imagCloudStorageResult = await _employeecloudStorageService.uploadImage(
        imageToUpload: _selectedImage, name: name);
    var result = await _authenticationService.signUpWithEmailEmployee(
        employeeEmailAddress: employeeEmailAddress,
        name: name,
        motherName: motherName,
        address: address,
        fatherName: fatherName,
        dateOfBirth: dateOfBirth,
        city: city,
        gender: _selectedGender,
        phoneNumber: phoneNumber,
        aadharNumber: aadharNumber,
        alternatePhoneNumber: alternatePhoneNumber,
        lastCompanyWorkedFor: lastCompanyWorkedFor,
        lastWorkingDesignation: lastWorkingDesignation,
        workExperiance: workExperiance,
        educationalQualification: educationalQualification,
        pincode: pincode,
        state: state,
        password: password,
        expectedSalary: expectedSalary,
        experiencebifurcationwithdesignation:
            experiencebifurcationwithdesignation,
        imageFileName: imagCloudStorageResult.imageFileName,
        imageUrl: imagCloudStorageResult.imageUrl,
        intrestarea: intrestarea,
        lastsalary: lastsalary,
        resumeFileName: storageResult.resumFileName,
        resumeUrl: storageResult.resumeUrl,
        technicalEducation: technicalEducation);
    ;
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
