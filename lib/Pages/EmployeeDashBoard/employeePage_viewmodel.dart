import 'dart:io';

import 'package:Scaleindia/ApiModel/employee_candidate_sourcing.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/cloudStorage_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/employee_cloud_storage.dart';
import 'package:Scaleindia/Services/firestore_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/shared/image_selector.dart';
import 'package:Scaleindia/shared/resum_selector.dart';
import 'package:flutter/foundation.dart';
import '../../locator.dart';
import '../../ViewModels/base_model.dart';

class EmployeePageViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final ResumeSelector _resumeSelector = locator<ResumeSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final EmployeeCloudStorageService _employeecloudStorageService =
      locator<EmployeeCloudStorageService>();
  EmployeeCandidateSourcing _candidateSourcing;
  String _selectedGender = 'Select a Gender';
  String get selectedRole => _selectedGender;
  File _selectedImage;
  File get selectedImage => _selectedImage;
  File _selectedResume;
  File get selectedResume => _selectedResume;
  List<EmployeeCandidateSourcing> _posts;
  List<EmployeeCandidateSourcing> get posts => _posts;
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

  bool get _editting => _candidateSourcing != null;

  Future addPost({
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
    CloudStorageResult storageResult;
    EmployeeCloudStorageResult employeeResumStorageResult;
    var result;
    if (!_editting) {
      storageResult = await _cloudStorageService.uploadImage(
        imageToUpload: _selectedImage,
        name: name,
      );
      employeeResumStorageResult = await _employeecloudStorageService
          .uploadImage1(resumToUpload: _selectedResume, name: name);
    }
    if (!_editting) {
      result = await _firestoreService.addPost(EmployeeCandidateSourcing(
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
          expectedSalary: expectedSalary,
          experiencebifurcationwithdesignation:
              experiencebifurcationwithdesignation,
          imageFileName: storageResult.imageFileName,
          imageUrl: storageResult.imageUrl,
          intrestarea: intrestarea,
          lastsalary: lastsalary,
          resumeFileName: employeeResumStorageResult.resumFileName,
          resumeUrl: employeeResumStorageResult.resumFileName,
          technicalEducation: technicalEducation));
    } else {
      result = await _firestoreService.updatePost(EmployeeCandidateSourcing(
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
          expectedSalary: expectedSalary,
          experiencebifurcationwithdesignation:
              experiencebifurcationwithdesignation,
          imageFileName: storageResult.imageFileName,
          imageUrl: storageResult.imageUrl,
          intrestarea: intrestarea,
          lastsalary: lastsalary,
          resumeFileName: employeeResumStorageResult.resumFileName,
          resumeUrl: employeeResumStorageResult.resumFileName,
          technicalEducation: technicalEducation,
          documentId: _candidateSourcing.documentId));
    }

    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound not create ',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'Successfully submitted',
        description: 'Your details has been submitted',
      );
    }

    _navigationService.navigateTo(ECASHomePageViewRoute);
  }

  void setEdittingPost(EmployeeCandidateSourcing edittingPost) {
    _candidateSourcing = edittingPost;
  }

  void listenToPosts1() {
    setBusy(true);

    _firestoreService.listenToPostsRealTimeECAS().listen((postsData) {
      List<EmployeeCandidateSourcing> updatedPosts = postsData;
      if (updatedPosts != null && updatedPosts.length > 0) {
        _posts = updatedPosts;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  Future deletePost(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the post?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      var postToDelete = _posts[index];
      setBusy(true);
      await _firestoreService.deletePost(postToDelete.documentId);
      // Delete the image after the post is deleted
      await _cloudStorageService.deleteImage(postToDelete.imageFileName);
      setBusy(false);
    }
  }

  void editPost(int index) {
    _navigationService.navigateTo(ECASCreatePageViewRoute,
        arguments: _posts[index]);
  }

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

  Future<void> forgot({
    @required String email,
  }) async {
    _authenticationService.sendPasswordResetEmail(email: email);
    _dialogService.showDialog(
        title: 'Reset Password',
        description: 'A password reset link has beeen sent to' + email);
  }

  Future navigateToECASCreateView() async {
    await _navigationService.navigateTo(ECASCreatePageViewRoute);
  }

  Future navigateToECASHomeView() async {
    await _navigationService.navigateTo(ECASHomePageViewRoute);
  }

  void navigateToCandidateSourcingView() async {
    _navigationService.navigateTo(CandidateSouringPageViewRoute);
  }

  Future logOut() async {
    await _authenticationService.signOut();
    _navigationService.navigateTo(HomeViewRoute);
  }

  void navigateBackToLogin() {
    _navigationService.navigateTo(EmployeeViewRoute);
  }

  void navigateToEmployeeRegister() {
    _navigationService.navigateTo(EmployeeRegisterViewRoute);
  }

  void navigateToForgotPage1() {
    _navigationService.navigateTo(ForgotPage1ViewRoute);
  }

  void listenToPosts() {
    _firestoreService.listenToPostRealtimeEmployee();
  }
}
