import 'dart:io';
import 'dart:math';
import 'package:Scaleindia/Pages/assessment/utils.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';

import 'assessor_viewmodel.dart';
import 'bottom_sheet.dart';

class Task2 extends StatefulWidget {
  final Function onPressed;
  const Task2({this.onPressed});
  @override
  _Task2State createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  bool _isloading1 = false;
  double _progress1;
  bool _isloading2 = false;
  double _progress2;
  bool _isloading3 = false;
  double _progress3;
  bool _isloading4 = false;
  double _progress4;
  CameraController _camera;
  bool showCapturedPhoto = false;
  CameraLensDirection _direction = CameraLensDirection.back;
  Future initializecamera() async {
    CameraDescription description = await getCamera(_direction);
    _camera = CameraController(description, ResolutionPreset.ultraHigh,
        enableAudio: false);
    await _camera.initialize();
  }

  Future<void> opencamera1(BuildContext context) async {
    await initializecamera();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _buildImage1(context)),
    );
  }

  Widget _buildImage1(BuildContext context) {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: ColorLoader3(
          radius: 20.0,
          dotRadius: 10.0,
        ),
      );
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_camera),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.camera),
        onPressed: () {
          takePhotoByCamera1(context);
        },
        heroTag: null,
      ),
    );
  }

  Future<void> takePhotoByCamera1(BuildContext context) async {
    try {
      final path = join((await getTemporaryDirectory()).path,
          '${DateTime.now()}.png' //Temporary path
          );
      await _camera.takePicture(path);
      File cropped = await ImageCropper.cropImage(sourcePath: path);
      uploadImage1(cropped);
      Navigator.of(context).pop();
      setState(() {
        showCapturedPhoto = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addImageToDatabase1(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('Task2').doc().set({
        'url1': imageString,
        'one': text,
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> uploadImage1(File image) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String imageLocation = 'Sop-task-2/image$randomNumber.jpg';
      final Reference reference =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(imageLocation);
      final UploadTask uploadTask = reference.putFile(image);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading1 = true;
          _progress1 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress1);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      _addImageToDatabase1(imageLocation);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  progress1(loading, BuildContext context) {
    if (loading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "2:",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          _isloading2 == true
              ? Text(
                  'Uploaded successfully',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.greenAccent,
                    fontSize: 17.0,
                  ),
                )
              : BottomSheetWidget(onPressed: () {
                  opencamera2(context);
                })
        ],
      );
    } else {
      return Text('');
    }
  }

  Future<void> opencamera2(BuildContext context) async {
    await initializecamera();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _buildImage2(context)),
    );
  }

  Future<void> takePhotoByCamera2(BuildContext context) async {
    try {
      final path = join((await getTemporaryDirectory()).path,
          '${DateTime.now()}.png' //Temporary path
          );
      await _camera.takePicture(path);
      File cropped = await ImageCropper.cropImage(sourcePath: path);
      uploadImage2(cropped);
      Navigator.of(context).pop();
      setState(() {
        showCapturedPhoto = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Widget _buildImage2(BuildContext context) {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: ColorLoader3(
          radius: 20.0,
          dotRadius: 10.0,
        ),
      );
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_camera),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.camera),
        onPressed: () {
          takePhotoByCamera2(context);
        },
        heroTag: null,
      ),
    );
  }

  Future<void> _addImageToDatabase2(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('Task2').doc().set({
        'url2': imageString,
        'Two2': text,
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> uploadImage2(File image) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String imageLocation = 'Sop-task-2/image$randomNumber.jpg';
      final Reference reference =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(imageLocation);
      final UploadTask uploadTask = reference.putFile(image);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading2 = true;
          _progress2 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress2);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      _addImageToDatabase2(imageLocation);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  progress2(loading, BuildContext context) {
    if (loading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "3:",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          _isloading3 == true
              ? Text(
                  'Uploaded successfully',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.greenAccent,
                    fontSize: 17.0,
                  ),
                )
              : BottomSheetWidget(onPressed: () {
                  opencamera3(context);
                })
        ],
      );
    } else {
      return Text('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
        viewModelBuilder: () => AssessorPageViewModel(),
        builder: (context, model, child) => Container(
              width: 280.0,
              margin: const EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                      "TASK 2",
                      style: kTitleStyle.copyWith(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '1:',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            _isloading1 == true
                                ? Text(
                                    'Uploaded successfully',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.greenAccent,
                                      fontSize: 17.0,
                                    ),
                                  )
                                : BottomSheetWidget(onPressed: () {
                                    opencamera1(context);
                                  })
                          ],
                        ),
                        progress1(_isloading1, context),
                        progress2(_isloading2, context),
                        progress3(_isloading3, context),
                      ],
                    ),
                  ),
                  Center(child: progress4(_isloading4, context))
                ],
              ),
            ));
  }

  Future<void> opencamera3(BuildContext context) async {
    await initializecamera();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _buildImage3(context)),
    );
  }

  Widget _buildImage3(BuildContext context) {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: ColorLoader3(
          radius: 20.0,
          dotRadius: 10.0,
        ),
      );
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_camera),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.camera),
        onPressed: () {
          takePhotoByCamera3(context);
        },
        heroTag: null,
      ),
    );
  }

  Future<void> takePhotoByCamera3(BuildContext context) async {
    try {
      final path = join((await getTemporaryDirectory()).path,
          '${DateTime.now()}.png' //Temporary path
          );
      await _camera.takePicture(path);
      File cropped = await ImageCropper.cropImage(sourcePath: path);
      uploadImage3(cropped);
      Navigator.of(context).pop();
      setState(() {
        showCapturedPhoto = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addImageToDatabase3(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('Task2').doc().set({
        'url3': imageString,
        'three': text,
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> uploadImage3(File image) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String imageLocation = 'Sop-task-2/image$randomNumber.jpg';
      final Reference reference =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(imageLocation);
      final UploadTask uploadTask = reference.putFile(image);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading3 = true;
          _progress3 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress3);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      _addImageToDatabase3(imageLocation);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  progress3(loading, BuildContext context) {
    if (loading) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "4:",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
          _isloading4 == true
              ? Text(
                  'Uploaded successfully',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: Colors.greenAccent,
                    fontSize: 17.0,
                  ),
                )
              : BottomSheetWidget(onPressed: () {
                  opencamera4(context);
                })
        ],
      );
    } else {
      return Text('');
    }
  }

  Future<void> opencamera4(BuildContext context) async {
    await initializecamera();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _buildImage4(context)),
    );
  }

  Widget _buildImage4(BuildContext context) {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: ColorLoader3(
          radius: 20.0,
          dotRadius: 10.0,
        ),
      );
    }
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          CameraPreview(_camera),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        child: Icon(Icons.camera),
        onPressed: () {
          takePhotoByCamera4(context);
        },
        heroTag: null,
      ),
    );
  }

  Future<void> takePhotoByCamera4(BuildContext context) async {
    try {
      final path = join((await getTemporaryDirectory()).path,
          '${DateTime.now()}.png' //Temporary path
          );
      await _camera.takePicture(path);
      File cropped = await ImageCropper.cropImage(sourcePath: path);
      uploadImage4(cropped);
      Navigator.of(context).pop();
      setState(() {
        showCapturedPhoto = true;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addImageToDatabase4(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('Task2').doc().set({
        'url4': imageString,
        'four': text,
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> uploadImage4(File image) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String imageLocation = 'Sop-task-2/image$randomNumber.jpg';
      final Reference reference =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(imageLocation);
      final UploadTask uploadTask = reference.putFile(image);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading4 = true;
          _progress4 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress4);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      _addImageToDatabase4(imageLocation);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  progress4(loading, BuildContext context) {
    if (loading) {
      // ignore: deprecated_member_use
      return RaisedButton(
        splashColor: Colors.blue,
        elevation: 5.0,
        color: new Color(0xFF34A853),
        child: Text(
          'Task-3',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        onPressed: this.widget.onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      );
    } else {
      return Text('');
    }
  }
}

class TaskTwo {
  final String one;
  final String url1;
  final String two;
  final String url2;
  final String three;
  final String url3;
  final String four;
  final String url4;

  final DocumentReference reference;

  TaskTwo.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['one'] != null),
        assert(map['url1'] != null),
        one = map['one'],
        url1 = map['url1'],
        two = map['two'],
        url2 = map['map'],
        three = map['three'],
        url3 = map['three'],
        four = map['four'],
        url4 = map['url4'];

  TaskTwo.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Task2<$one:$url1>";
}
