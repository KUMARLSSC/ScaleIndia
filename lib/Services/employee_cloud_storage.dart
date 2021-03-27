import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class EmployeeCloudStorageService {
  Future<EmployeeCloudStorageResult> uploadImage1({
    @required File resumToUpload,
    @required String name,
  }) async {
    var resumFileName = name + DateTime.now().millisecondsSinceEpoch.toString();

    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(resumFileName);

    UploadTask uploadTask = firebaseStorageRef.putFile(resumToUpload);

    TaskSnapshot storageSnapshot = await uploadTask;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    if (uploadTask.snapshotEvents.isBroadcast) {
      var url = downloadUrl.toString();
      return EmployeeCloudStorageResult(
        resumeUrl: url,
        resumFileName: resumFileName,
      );
    }

    return null;
  }

  Future deleteImage1(String resumFileName) async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(resumFileName);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }

  Future<ImagCloudStorageResult> uploadImage({
    @required File imageToUpload,
    @required String name,
  }) async {
    var imageFileName = name + DateTime.now().millisecondsSinceEpoch.toString();

    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    UploadTask uploadTask = firebaseStorageRef.putFile(imageToUpload);

    TaskSnapshot storageSnapshot = await uploadTask;

    var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    if (uploadTask.snapshotEvents.isBroadcast) {
      var url = downloadUrl.toString();
      return ImagCloudStorageResult(
        imageUrl: url,
        imageFileName: imageFileName,
      );
    }

    return null;
  }

  Future deleteImage(String imageFileName) async {
    final Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(imageFileName);

    try {
      await firebaseStorageRef.delete();
      return true;
    } catch (e) {
      return e.toString();
    }
  }
}

class ImagCloudStorageResult {
  final String imageUrl;
  final String imageFileName;

  ImagCloudStorageResult({
    this.imageUrl,
    this.imageFileName,
  });
}

class EmployeeCloudStorageResult {
  final String resumeUrl;
  final String resumFileName;

  EmployeeCloudStorageResult({this.resumFileName, this.resumeUrl});
}
