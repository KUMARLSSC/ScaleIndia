import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Pages/assessment/language_page1.dart';
import 'package:Scaleindia/Pages/assessment/langugae_page.dart';
import 'package:Scaleindia/Pages/assessment/fifthpage_viewmodel.dart';
import 'package:Scaleindia/Pages/assessment/utils.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:image/image.dart' as imglib;
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;
import 'utils.dart';
import 'package:quiver/collection.dart';

class FourthPage extends StatefulWidget {
  final Candidate candidate;
  final CenterAssesor centerAssesor;
  FourthPage({this.candidate, this.centerAssesor});
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String url;
  bool _isloading = false;
  double _progress;
  bool _isloading2 = false;
  double _progress2;
  final theory = true;
  final practical = true;
  File jsonFile;
  // ignore: unused_field
  dynamic _scanResults;
  CameraController _camera;
  var interpreter;
  bool showCapturedPhoto = false;
  var imagePath;
  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.front;
  dynamic data = {};
  double threshold = 1.0;
  Directory tempDir;
  List e1;
  bool _faceFound = false;
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _initializeCamera();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    audioCache.play('4th.mp3');
  }

  Future loadModel() async {
    try {
      final gpuDelegateV2 = tfl.GpuDelegateV2(
          options: tfl.GpuDelegateOptionsV2(
        false,
        tfl.TfLiteGpuInferenceUsage.fastSingleAnswer,
        tfl.TfLiteGpuInferencePriority.minLatency,
        tfl.TfLiteGpuInferencePriority.auto,
        tfl.TfLiteGpuInferencePriority.auto,
      ));

      var interpreterOptions = tfl.InterpreterOptions()
        ..addDelegate(gpuDelegateV2);
      interpreter = await tfl.Interpreter.fromAsset('mobilefacenet.tflite',
          options: interpreterOptions);
    } on Exception {
      print('Failed to load model.');
    }
  }

  void _initializeCamera() async {
    await loadModel();
    CameraDescription description = await getCamera(_direction);

    ImageRotation rotation = rotationIntToImageRotation(
      description.sensorOrientation,
    );

    _camera =
        CameraController(description, ResolutionPreset.low, enableAudio: false);
    await _camera.initialize();
    await Future.delayed(Duration(milliseconds: 500));
    tempDir = await getApplicationDocumentsDirectory();
    String _embPath = tempDir.path + '/emb.json';
    jsonFile = new File(_embPath);
    if (jsonFile.existsSync()) data = json.decode(jsonFile.readAsStringSync());

    _camera.startImageStream((CameraImage image) {
      if (_camera != null) {
        if (_isDetecting) return;
        _isDetecting = true;
        String res;
        dynamic finalResult = Multimap<String, Face>();
        detect(image, _getDetectionMethod(), rotation).then(
          (dynamic result) async {
            if (result.length == 0)
              _faceFound = false;
            else
              _faceFound = true;
            Face _face;
            imglib.Image convertedImage =
                _convertCameraImage(image, _direction);
            for (_face in result) {
              double x, y, w, h;
              x = (_face.boundingBox.left - 10);
              y = (_face.boundingBox.top - 10);
              w = (_face.boundingBox.width + 10);
              h = (_face.boundingBox.height + 10);
              imglib.Image croppedImage = imglib.copyCrop(
                  convertedImage, x.round(), y.round(), w.round(), h.round());
              croppedImage = imglib.copyResizeCropSquare(croppedImage, 112);
              // int startTime = new DateTime.now().millisecondsSinceEpoch;
              res = _recog(croppedImage);
              // int endTime = new DateTime.now().millisecondsSinceEpoch;
              // print("Inference took ${endTime - startTime}ms");
              finalResult.add(res, _face);
            }
            setState(() {
              _scanResults = finalResult;
            });

            _isDetecting = false;
          },
        ).catchError(
          (_) {
            _isDetecting = false;
          },
        );
      }
    });
  }

  HandleDetection _getDetectionMethod() {
    final faceDetector = FirebaseVision.instance.faceDetector(
      FaceDetectorOptions(
        mode: FaceDetectorMode.accurate,
      ),
    );
    return faceDetector.processImage;
  }

  imglib.Image _convertCameraImage(
      CameraImage image, CameraLensDirection _dir) {
    int width = image.width;
    int height = image.height;
    // imglib -> Image package from https://pub.dartlang.org/packages/image
    var img = imglib.Image(width, height); // Create Image buffer
    const int hexFF = 0xFF000000;
    final int uvyButtonStride = image.planes[1].bytesPerRow;
    final int uvPixelStride = image.planes[1].bytesPerPixel;
    for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {
        final int uvIndex =
            uvPixelStride * (x / 2).floor() + uvyButtonStride * (y / 2).floor();
        final int index = y * width + x;
        final yp = image.planes[0].bytes[index];
        final up = image.planes[1].bytes[uvIndex];
        final vp = image.planes[2].bytes[uvIndex];
        // Calculate pixel color
        int r = (yp + vp * 1436 / 1024 - 179).round().clamp(0, 255);
        int g = (yp - up * 46549 / 131072 + 44 - vp * 93604 / 131072 + 91)
            .round()
            .clamp(0, 255);
        int b = (yp + up * 1814 / 1024 - 227).round().clamp(0, 255);
        // color: 0x FF  FF  FF  FF
        //           A   B   G   R
        img.data[index] = hexFF | (b << 16) | (g << 8) | r;
      }
    }
    var img1 = (_dir == CameraLensDirection.front)
        ? imglib.copyRotate(img, -90)
        : imglib.copyRotate(img, 90);
    return img1;
  }

  String _recog(imglib.Image img) {
    List input = imageToByteListFloat32(img, 112, 128, 128);
    input = input.reshape([1, 112, 112, 3]);
    // ignore: deprecated_member_use
    List output = List(
      1 * 192,
    ).reshape([1, 192]);
    interpreter.run(input, output);
    output = output.reshape([192]);
    e1 = List.from(output);
    return compare(e1).toUpperCase();
  }

  String compare(List currEmb) {
    if (data.length == 0) return "No Face saved";
    double minDist = 999;
    double currDist = 0.0;
    String predRes = "NOT RECOGNIZED";
    for (String label in data.keys) {
      currDist = euclideanDistance(data[label], currEmb);
      if (currDist <= threshold && currDist < minDist) {
        minDist = currDist;
        predRes = label;
      }
    }
    print(minDist.toString() + " " + predRes);
    return predRes;
  }

  Future<void> uploadImage(File image) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String imageLocation = 'images/image$randomNumber.jpg';
      // ignore: deprecated_member_use
      final Reference reference =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
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

  Future<void> uploadImage2(File image2) async {
    try {
      int randomNumber2 = Random().nextInt(10000000);
      String imageLocation2 = 'Aadhar/image$randomNumber2.jpg';
      final Reference reference2 =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(imageLocation2);
      final UploadTask uploadTask = reference2.putFile(image2);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading2 = true;
          _progress2 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress2);
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
      final ref = FirebaseStorage.instance.ref().child(text2);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('AadharCard').doc().set({
        'url': imageString,
        'location': text2,
        'candidateID': widget.candidate.clEnrollmentNo,
      });
    } catch (e) {
      print(e.message);
    }
  }

  Future<void> _addImageToDatabase(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('Image').doc().set({
        'url': imageString,
        'location': text,
        'candidateID': widget.candidate.clEnrollmentNo,
        'candidateName': widget.candidate.clName,
      });
    } catch (e) {
      print(e.message);
      /*showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message),
            );
          });*/
    }
  }

  Future<void> onCaptureButtonPressed(BuildContext context) async {
    //on camera button press
    try {
      if (_camera?.value?.isStreamingImages == true && mounted) {
        await _camera.stopImageStream();
      }

      final path = join((await getTemporaryDirectory()).path,
          '${DateTime.now()}.png' //Temporary path
          );
      await _camera.takePicture(path);
      File cropped = await ImageCropper.cropImage(sourcePath: path);
      uploadImage(cropped);
      Navigator.of(context).pop();
      setState(() {
        showCapturedPhoto = true;
      });
    } catch (e) {
      print(e);
    }
  }

  void _handle(String text, BuildContext context) async {
    data[text] = e1;
    jsonFile.writeAsStringSync(json.encode(data));
    onCaptureButtonPressed(context);
  }

  Future<void> onCaptureButtonPressed2(BuildContext context) async {
    //on camera button press
    try {
      if (_camera?.value?.isStreamingImages == true && mounted) {
        await _camera.stopImageStream();
      }

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

  void _handle2(String text, BuildContext context) async {
    data[text] = e1;
    jsonFile.writeAsStringSync(json.encode(data));
    onCaptureButtonPressed2(context);
  }

  // ignore: unused_element
  void _toggleCameraDirection() async {
    if (_direction == CameraLensDirection.back) {
      _direction = CameraLensDirection.front;
    } else {
      _direction = CameraLensDirection.back;
    }
    await _camera.stopImageStream();
    await _camera.dispose();

    setState(() {
      _camera = null;
    });

    _initializeCamera();
  }

  Widget _buildImage(BuildContext context) {
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
        backgroundColor: (_faceFound) ? Colors.blue : Colors.blueGrey,
        child: Icon(Icons.camera),
        onPressed: () {
          if (_faceFound) _handle(widget.candidate.clName, context);
        },
        heroTag: null,
      ),
    );
  }

  Widget _buildImage2(BuildContext context) {
    if (_camera == null || !_camera.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(),
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
        backgroundColor: (_faceFound) ? Colors.blue : Colors.blueGrey,
        child: Icon(Icons.camera),
        onPressed: () {
          if (_faceFound) _handle2(widget.candidate.clName, context);
        },
        heroTag: null,
      ),
    );
  }

  Future<void> opencamera(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _buildImage(context)),
    );
  }

  Future<void> opencamera2(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _buildImage2(context)),
    );
  }

  progress(loading, BuildContext context) {
    if (loading) {
      return Center(
        // ignore: deprecated_member_use
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
            opencamera2(context);
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

  progress2(loading, BuildContext context) {
    if (loading) {
      return Column(
        children: <Widget>[
          Center(
            child: Container(
              child: widget.candidate.clTheoryDeone == theory
                  // ignore: deprecated_member_use
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
                  // ignore: deprecated_member_use
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
                  // ignore: deprecated_member_use
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
                  // ignore: deprecated_member_use
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      style: TextStyle(color: Colors.black, fontSize: 17)),
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
                      progress2(_isloading2, context),
                      // ignore: deprecated_member_use
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
                        onPressed: () {
                          opencamera(context);
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.blueAccent),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      progress(_isloading, context),
                    ],
                  ),
                ),
              ),
            ])),
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
  final String candidateName;
  final DocumentReference reference;

  AadharStorage.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        candidateID = map['candidateID'],
        url = map['url'],
        candidateName = map['candidateName'];

  AadharStorage.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "ImageStorage<$location:$url>";
}
