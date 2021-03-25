import 'dart:io';
import 'dart:math';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_result_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/api_services.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Pages/assessment/practicalpage_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:video_compress/video_compress.dart';
import '../../locator.dart';

class PracticalPageWidget extends StatefulWidget {
  final List<Practical> practical;
  final Practical practical1;
  final Candidate candidate;
  PracticalPageWidget(
      {Key key, this.practical, this.candidate, this.practical1})
      : super(key: key);
  @override
  _PracticalPageWidgetState createState() => _PracticalPageWidgetState();
}

class _PracticalPageWidgetState extends State<PracticalPageWidget> {
  final DialogService _dialogService = locator<DialogService>();
  final TextEditingController textController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  final Map<int, dynamic> _answers = {};
  final Api _api = locator<Api>();
  bool _isloading = false;
  double _progress;
  setSelectedUser(int val) {
    setState(() {
      _currentIndex = val;
      _currentIndex = _isloading as int;
    });
  }

  int _currentIndex = 0;
  int a = 0;

  @override
  Widget build(BuildContext context) {
    String _text = "";
    this.widget.practical.retainWhere(
        (element) => element.pqLang.contains(this.widget.practical1.pqLang));
    return ViewModelBuilder<PracticalPageViewModel>.reactive(
        viewModelBuilder: () => PracticalPageViewModel(),
        builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height - 650,
                    color: kBlack,
                    child: Center(
                      child: Text(
                        widget.practical[_currentIndex].pqNos,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Card(
                    color: kBlackAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 15.0, left: 16.0, right: 16.0),
                      child: Text(
                        widget.practical[_currentIndex].pqCommonQuestion != null
                            ? widget.practical[_currentIndex].pqCommonQuestion
                            : "No Common Question for this ${widget.practical[_currentIndex].pqNos} ",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 15.0, left: 16.0, right: 16.0),
                      child: Text(
                        "${_currentIndex + 1}: " +
                            widget.practical[_currentIndex].pqQuestion,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // ignore: deprecated_member_use
                  _isloading == true
                      ? progress(_isloading)
                      // ignore: deprecated_member_use
                      : RaisedButton.icon(
                          onPressed: () {
                            // opencamera();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          label: Text(
                            'Observation',
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                          textColor: Colors.white,
                          splashColor: Colors.blue,
                          color: Colors.green,
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Max Marks:${widget.practical[_currentIndex].pqMarks.toString()}",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Enter Marks:",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(32, 132, 232, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10))
                        ]),
                    child: Container(
                      height: 80,
                      width: 150,
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: _text,
                        text1InputType: TextInputType.number,
                        controller: textController,
                        onChanged: (v) => setState(() {
                          _text = v;
                          _answers[_currentIndex] = v;
                        }),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          splashColor: Colors.blue,
                          elevation: 5.0,
                          color: _currentIndex ==
                                  (widget.practical.length +
                                      1 -
                                      widget.practical.length -
                                      1)
                              ? Colors.white30
                              : new Color(0xFFEA4335),
                          child: Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _currentIndex ==
                                    (widget.practical.length +
                                        1 -
                                        widget.practical.length -
                                        1)
                                // ignore: unnecessary_statements
                                ? null
                                : _previous();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          splashColor: Colors.blue,
                          elevation: 5.0,
                          color: new Color(0xFF34A853),
                          child: Text(
                            _currentIndex == (widget.practical.length - 1)
                                ? "Submit"
                                : "Next",
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            _nextSubmit(mark: textController.text);
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.only(bottom: 300.0)),
                ],
              ),
            )));
  }

  void _nextSubmit({@required String mark}) async {
    if (_answers[_currentIndex] == null) {
      _dialogService.showDialog(
        title: 'Failed',
        description: "You must enter a mark to continue",
      );
    }
    if (int.parse(mark) > widget.practical[_currentIndex].pqMarks) {
      _dialogService.showDialog(
        title: 'Failed',
        description: "Input value is greater than Maximum Marks",
      );
      return;
    }
    /* if (_isloading == false) {
      _dialogService.showDialog(
        title: 'Failed ',
        description: "Please upload a video to continue",
      );
      return;
    }*/
    if (_currentIndex < (widget.practical.length - 1)) {
      setState(() {
        _currentIndex++;
      });
      setState(() {
        a = int.parse(textController.text);
        textController.text = " ";
      });
    } else {
      var tempManipulatedData = {};
      CenterAssesor centerAssesor =
          Provider.of<CenterAssesor>(context, listen: false);
      this._answers.forEach((index, value) {
        var quesObj = this.widget.practical[index];
        String tqNos = quesObj.pqNos;
        if (tqNos == null) {
          tqNos = "0";
        }
        if (tempManipulatedData[tqNos] == null) {
          tempManipulatedData[tqNos] = PracticalResult.fromJson({
            'prId': 0,
            'prbatchId': centerAssesor.asId,
            'prCandidateId': this.widget.candidate.clEnrollmentNo,
            'prQuestionId': 0,
            'prMarks': 0,
            'prNos': tqNos,
            'prType': false,
          });
        }
        tempManipulatedData[tqNos].prQuestionId =
            tempManipulatedData[tqNos].prQuestionId + 1;
        if (textController.text != value)
          tempManipulatedData[tqNos].prMarks =
              tempManipulatedData[tqNos].prMarks + 1;
      });
      print(tempManipulatedData);

      // ignore: deprecated_member_use
      var list = new List<PracticalResult>();
      tempManipulatedData.forEach((key, value) {
        if (value.prNos == "0") {
          value['prNos'] = null;
        }
        list.add(value);
      });
      await _loading()
          .then((value) => _api.updateTheory(list))
          .whenComplete(() => showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text("Completed"),
                    content: Text("Practical exam was completed successfully"),
                    actions: <Widget>[
                      // ignore: deprecated_member_use
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _navigationService.navigateTo(ThirdViewRoute);
                        },
                      )
                    ],
                  )));
    }
  }

  Future<void> _loading() async {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            actions: [
              // ignore: deprecated_member_use
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
            title: Text(
              'Please wait loading',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            content: Center(
                child: ColorLoader3(
              radius: 20.0,
              dotRadius: 10.0,
            )));
      },
    );
  }

  void _previous() {
    if (_currentIndex <= (widget.practical.length - 1)) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  Future<void> uploadImage(File video) async {
    try {
      int randomNumber = Random().nextInt(10000000);
      String videoLocation = 'practical/video$randomNumber.jpg';
      // ignore: deprecated_member_use
      final Reference reference =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(videoLocation);
      final UploadTask uploadTask = reference.putFile(video);

      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading = true;
          _progress = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      _addImageToDatabase(videoLocation);
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addImageToDatabase(String text) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text);
      var videoString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('PracticalVideo').doc().set({
        'url': videoString,
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

  void opencamera() async {
    final pickedFile = await ImagePicker().getVideo(source: ImageSource.camera);
    await VideoCompress.setLogLevel(0);
    MediaInfo compress = await VideoCompress.compressVideo(
      pickedFile.path,
      quality: VideoQuality.MediumQuality,
      deleteOrigin: false,
      includeAudio: true,
    );
    uploadImage(compress.file);
  }

  progress(loading) {
    if (loading) {
      // ignore: deprecated_member_use
      return RaisedButton.icon(
        onPressed: () {
          print('Button Clicked.');
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        label: Text(
          'Uploaded',
          style: TextStyle(color: Colors.white),
        ),
        icon: Icon(
          Icons.videocam,
          color: Colors.white,
        ),
        textColor: Colors.white,
        splashColor: Colors.blue,
        color: Colors.grey,
      );
    } else {
      return Text('');
    }
  }
}

class PracticalVide0Storage {
  final String location;
  final String url;
  final String candidateID;
  final DocumentReference reference;

  PracticalVide0Storage.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        candidateID = map['candidateID'],
        url = map['url'];

  PracticalVide0Storage.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "PracticalVide0Storage<$location:$url>";
}
