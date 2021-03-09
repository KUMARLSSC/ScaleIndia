import 'dart:io';

import 'package:Scaleindia/ApiModel/company_sourcing.dart';
import 'package:Scaleindia/ApiModel/employee_candidate_sourcing.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/cloudStorage_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/firestore_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/shared/image_selector.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class CreatePostViewModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final ImageSelector _imageSelector = locator<ImageSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();

  File _selectedImage;
  File get selectedImage => _selectedImage;

  EmployeeCandidateSourcing _candidateSourcing;
  ComapanySourcing _comapanySourcing;
  String _selectedGender = 'Select a Gender';
  String _selecteFunction = 'Select a Function';
  String _selecteJobRole = "Select JobRole";
  String get selectedRole => _selectedGender;
  String get selectedFunction => _selecteFunction;
  String get selectJobRole => _selecteJobRole;
  List<ComapanySourcing> _lists;
  List<ComapanySourcing> get lists => _lists;
  List<EmployeeCandidateSourcing> _posts;
  List<EmployeeCandidateSourcing> get posts => _posts;
  void setSelectedRole(dynamic gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setSelectedFunction(dynamic function) {
    _selecteFunction = function;
    notifyListeners();
  }

  void setSelectedJobRole(dynamic jobRole) {
    _selecteJobRole = jobRole;
    notifyListeners();
  }

  Future selectImage() async {
    var tempImage = await _imageSelector.selectImage();
    if (tempImage != null) {
      _selectedImage = File(tempImage.path);
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
  }) async {
    setBusy(true);
    CloudStorageResult storageResult;
    var result;
    if (!_editting) {
      storageResult = await _cloudStorageService.uploadImage(
        imageToUpload: _selectedImage,
        name: name,
      );
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
        imageUrl: storageResult.imageUrl,
        imageFileName: storageResult.imageFileName,
      ));
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
          imageUrl: storageResult.imageUrl,
          imageFileName: storageResult.imageFileName,
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

  void listenToPosts() {
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

  Future navigateToCreateView() async {
    await _navigationService.navigateTo(ECASCreatePageViewRoute);
  }

  Future navigateToCsCreateView() async {
    await _navigationService.navigateTo(CompanyHomePageViewRoute);
  }

  Future addPostCs(
      {@required String companyname,
      @required String requestDepartment,
      @required String gender,
      @required String duration,
      @required String function,
      @required String jobRole,
      @required String numberofposition,
      @required String qualification,
      @required String experience,
      @required String state,
      @required String city,
      @required String dateOfJoin,
      @required String specificDetails,
      @required String category}) async {
    setBusy(true);
    //CloudStorageResult storageResult;
    var result;
    /* if (!_editting) {
      storageResult = await _cloudStorageService.uploadImage1(
        imageToUpload: _selectedImage,
        name: companyname,
      );
    }*/
    if (!_editting) {
      result = await _firestoreService.addPostCs(ComapanySourcing(
          city: city,
          companyname: companyname,
          specificDetails: specificDetails,
          requestDepartment: requestDepartment,
          gender: _selectedGender,
          duration: duration,
          function: _selecteFunction,
          experience: experience,
          state: state,
          dateOfJoin: dateOfJoin,
          //imageFilecompanyName: storageResult.imageFileName,
          //imageUrl: storageResult.imageUrl,
          jobRole: _selecteJobRole,
          qualification: qualification,
          numberofposition: numberofposition,
          category: category));
    } else {
      result = await _firestoreService.updatePostCs(ComapanySourcing(
          city: city,
          companyname: companyname,
          specificDetails: specificDetails,
          requestDepartment: requestDepartment,
          gender: gender,
          duration: duration,
          function: function,
          experience: experience,
          state: state,
          dateOfJoin: dateOfJoin,
          //imageFilecompanyName: storageResult.imageFileName,
          //imageUrl: storageResult.imageUrl,
          jobRole: jobRole,
          qualification: qualification,
          documentId: _comapanySourcing.documentId,
          category: category));
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

    _navigationService.navigateTo(CompanyHomePageViewRoute);
  }

  void listenToPostsCs() {
    setBusy(true);

    _firestoreService.listenToPostsRealTimeCs().listen((postsData) {
      List<ComapanySourcing> updatedPosts1 = postsData;
      if (updatedPosts1 != null && updatedPosts1.length > 0) {
        _lists = updatedPosts1;
        notifyListeners();
      }

      setBusy(false);
    });
  }
}
