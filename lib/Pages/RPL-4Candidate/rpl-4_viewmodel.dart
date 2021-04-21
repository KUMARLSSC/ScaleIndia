import 'dart:io';

import 'package:Scaleindia/ApiModel/rpl4_feedback_model.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/RPL-4Candidate/video_selector.dart';
import 'package:Scaleindia/Services/authentication_service.dart';
import 'package:Scaleindia/Services/cloudStorage_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/firestore_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/ViewModels/base_model.dart';
import 'package:Scaleindia/locator.dart';
import 'package:flutter/foundation.dart';
import 'package:video_compress/video_compress.dart';

class RPL4ViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();
  final VideoSelector _videoSelector = locator<VideoSelector>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  String phoneNumber = '1234567890';
  String _selectedtopic = 'Select a topic';
  String get selectedTopic => _selectedtopic;
  File _selectedVideo;
  File get selectedVideo => _selectedVideo;
  RPL4Feedback rpl4feedback;
  void setSelectedTopic(dynamic topic) {
    _selectedtopic = topic;
    notifyListeners();
  }

  Future selectVideo() async {
    var tempImage = await _videoSelector.selectVideo();
    if (tempImage != null) {
      _selectedVideo = File(tempImage.path);
      notifyListeners();
    }
  }

  bool get _editting => rpl4feedback != null;

  Future addFeedBack({
    @required String topic,
  }) async {
    setBusy(true);
    CloudStorageResult storageResult;
    MediaInfo compress = await VideoCompress.compressVideo(
      _selectedVideo.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
      includeAudio: true,
    );
    var result;
    if (!_editting) {
      storageResult = await _cloudStorageService.uploadImage(
        imageToUpload: compress.file,
        name: topic,
      );
    }
    if (!_editting) {
      result = await _firestoreService.addFeedback(RPL4Feedback(
          topic: topic,
          videoFileName: storageResult.imageFileName,
          videourl: storageResult.imageUrl));
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
        description: 'Your FeedBack has been submitted',
      );
    }
    _navigationService.navigateTo(RPL4HomePageViewRoute);
  }

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
        description: 'Please enter your phone number',
      );
    } else {
      await _dialogService.showDialog(
        title: 'Failed',
        description: 'Please enter valid number',
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
