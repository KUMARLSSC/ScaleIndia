import 'dart:io';
import 'dart:math';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Pages/language_page1.dart';
import 'package:Scaleindia/Pages/langugae_page.dart';
import 'package:Scaleindia/ViewModels/fifthpage_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';

class FifthPage extends StatefulWidget {
  final Candidate candidate;
  final CenterAssesor centerAssesor;
  FifthPage({this.candidate, this.centerAssesor});
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  String url;
  bool _isloading = false;
  double _progress;
  bool _isloading2 = false;
  double _progress2;
  final theory = true;
  final practical = true;
  progress(loading) {
    if (loading) {
      return Center(
        child: RaisedButton(
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
      );
    } else {
      return Text('');
    }
  }

  progress2(loading) {
    if (loading) {
      return Column(
        children: <Widget>[
          Center(
            child: Container(
              child: widget.candidate.clTheoryDeone == theory
                  ? RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 3.0,
                      color: Colors.black12,
                      child: Text(
                        'Theory',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    )
                  : RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 5.0,
                      color: new Color(0xFFEA4335),
                      child: Text(
                        'Theory',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LanguagePage(
                                      candidate: widget.candidate,
                                      centerAssesor: widget.centerAssesor,
                                    )));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              child: widget.candidate.clPracticalDone == practical
                  ? RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 3.0,
                      color: Colors.black12,
                      child: Text(
                        'Practical',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    )
                  : RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 5.0,
                      color: new Color(0xFF34A853),
                      child: Text(
                        'Practical',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LanguagePage1(
                                      candidate: widget.candidate,
                                    )));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
            ),
          ),
        ],
      );
    } else {
      return Center(
        child: Text(
          'Please upload your Photo and AadharCard to continue ',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }
  }

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
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading = true;
          _progress = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
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
    File cropped = await ImageCropper.cropImage(sourcePath: image.path);
    uploadImage(cropped);
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
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading2 = true;
          _progress2 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
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
    File cropped = await ImageCropper.cropImage(sourcePath: image2.path);
    uploadImage2(cropped);
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FifthPageViewModel>.reactive(
      viewModelBuilder: () => FifthPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
            child: header(context, isAppTitle: true, isIcon: false),
            preferredSize: Size.fromHeight(50.0)),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(7),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Start Your Practical and Theory Assessment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Candidate ID:",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17)),
                            TextSpan(
                                text: widget.candidate.clEnrollmentNo,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ])),
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 240.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Center(
                                    child: Text(
                                  "Instruction",
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "•The Assessment is of 60 mintues",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "• It is a multiple choice question with no negative marking",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "• For any issue contact the Assessor",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                progress2(_isloading2),
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
                                progress(_isloading),
                              ],
                            ),
                          ),
                        ),
                      ])),
            ],
          ),
        ),
      ),
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
