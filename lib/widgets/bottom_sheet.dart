import 'dart:io';
import 'dart:math';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File imageFile;

class BottomSheetWidget1 extends StatefulWidget {
  final Candidate candidate;
  BottomSheetWidget1({this.candidate});
  @override
  _BottomSheetWidget1State createState() => _BottomSheetWidget1State();
}

class _BottomSheetWidget1State extends State<BottomSheetWidget1> {
  String url;
  Future<void> uploadImage(File image) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String imageLocation = 'images/image$randomNumber.jpg';
      // ignore: deprecated_member_use
      final Reference reference =
          // ignore: deprecated_member_use
          FirebaseStorage(storageBucket: "gs://scale-india.appspot.com")
              .ref()
              .child(imageLocation);
      final UploadTask uploadTask = reference.putFile(image);
      TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text("Completed"),
                    content: Text("Photo was successfully uploaded"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      )
                    ],
                  )));
      _addImageToDatabase(imageLocation);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addImageToDatabase(String text) async {
    try {
      // Get image URL from firebase
      // ignore: deprecated_member_use
      final ref = FirebaseStorage().ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('Image').doc().set({
        'url': imageString,
        'location': text,
        'candidateID': widget.candidate.clEnrollmentNo,
      });
    } catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }

  Future takePhotoByCamera() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    uploadImage(image);
  }

  Future<void> uploadImage2(File image2) async {
    try {
      int randomNumber2 = Random().nextInt(10000000);
      String imageLocation2 = 'Aadhar/image$randomNumber2.jpg';
      // ignore: deprecated_member_use
      final Reference reference2 =
          // ignore: deprecated_member_use
          FirebaseStorage(storageBucket: "gs://scale-india.appspot.com")
              .ref()
              .child(imageLocation2);
      final UploadTask uploadTask = reference2.putFile(image2);
      TaskSnapshot taskSnapshot =
          await uploadTask.whenComplete(() => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text("Completed"),
                    content: Text("Aadhar was successfully uploaded"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      )
                    ],
                  )));
      _addImageToDatabase2(imageLocation2);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addImageToDatabase2(String text2) async {
    try {
      // Get image URL from firebase
      // ignore: deprecated_member_use
      final ref = FirebaseStorage().ref().child(text2);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('AadharCard').doc().set({
        'url': imageString,
        'location': text2,
        'candidateID': widget.candidate.clEnrollmentNo,
      });
    } catch (e) {
      print(e.message);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });
    }
  }

  Future takePhotoByCamera2() async {
    // ignore: deprecated_member_use
    var image2 = await ImagePicker.pickImage(source: ImageSource.camera);
    uploadImage2(image2);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          splashColor: Colors.blue,
          elevation: 5.0,
          color: kBlackAccent,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Upload your photo',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24.0,
              ),
            ],
          ),
          onPressed: takePhotoByCamera,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.blueAccent),
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          '&',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.0,
        ),
        RaisedButton(
          splashColor: Colors.blue,
          elevation: 5.0,
          color: kBlackAccent,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Upload Aadhar card',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24.0,
              ),
            ],
          ),
          onPressed: () {
            takePhotoByCamera2();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.blueAccent),
          ),
        ),
      ],
    );
  }
}

class ImageStorage {
  final String location;
  final String url;
  final String candidateID;
  final DocumentReference reference;

  ImageStorage.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        candidateID = map['candidateID'],
        url = map['url'];

  ImageStorage.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "ImageStorage<$location:$url>";
}

class AadharStorage {
  final String location;
  final String url;
  final String candidateID;
  final DocumentReference reference;

  AadharStorage.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        candidateID = map['candidateID'],
        url = map['url'];

  AadharStorage.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "ImageStorage<$location:$url>";
}
