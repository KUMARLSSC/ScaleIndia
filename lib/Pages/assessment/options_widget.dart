import 'dart:async';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_result_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/assessment/quiz_finished.dart';
import 'package:Scaleindia/Pages/assessment/summary_page.dart';
import 'package:Scaleindia/Services/api_services.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locator.dart';

// ignore: must_be_immutable
class Options extends StatefulWidget {
  final List<Theory> theory;
  final Theory theory1;
  final bool busy;
  final Candidate candidate;
  CameraController cameraController;
  int notReccount = 0;
  static final GlobalKey<_OptionsState> globalKey = GlobalKey();
  Options({
    Key key,
    this.theory1,
    this.theory,
    this.candidate,
    this.notReccount,
    this.busy = false,
    this.cameraController,
  }) : super(key: globalKey);
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final Map<int, dynamic> _answers = {};
  final Api _api = locator<Api>();
  final NavigationService _navigationService = locator<NavigationService>();
  AudioPlayer advancedPlayer;
  AudioCache audioCache;
  int _currentIndex = 0;
  setSelectedUser(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _loading();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    audioCache.play('disqualified.mp3');
    print(widget.theory.length);
  }

  @override
  Widget build(BuildContext context) {
    if (this.widget.notReccount == 80) {
      Timer.run(() => [
            _disqualified(),
            initPlayer(),
            this.widget.cameraController.stopImageStream(),
          ]);
    }

    this.widget.theory.retainWhere((element) =>
        element.tqLanguage.contains(this.widget.theory1.tqLanguage));
    return Column(
      children: [
        Card(
          color: kBlackAccent,
          child: Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 15.0, left: 16.0, right: 16.0),
              child: Column(
                children: [
                  Text(
                    "${_currentIndex + 1}: " +
                        widget.theory[_currentIndex].tqQuestion,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  widget.theory[_currentIndex].tqImg != null
                      ? Image.network(
                          widget.theory[_currentIndex].tqImg,
                          fit: BoxFit.fill,
                        )
                      : Container()
                ],
              )),
        ),
        SizedBox(
          height: 10.0,
        ),
        Card(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 1.0, bottom: 2.0, left: 16.0, right: 16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new RadioListTile<int>(
                    title: Text(
                      widget.theory[_currentIndex].tqOption1,
                      style: TextStyle(fontSize: 20),
                    ),
                    activeColor: Colors.green,
                    value: 1,
                    groupValue: _answers[_currentIndex],
                    onChanged: (val) {
                      setState(() {
                        _answers[_currentIndex] = 1;
                      });
                    },
                  ),
                  new RadioListTile<int>(
                    title: Text(
                      widget.theory[_currentIndex].tqOption2,
                      style: TextStyle(fontSize: 20),
                    ),
                    activeColor: Colors.green,
                    value: 2,
                    groupValue: _answers[_currentIndex],
                    onChanged: (val) {
                      setState(() {
                        _answers[_currentIndex] = 2;
                      });
                    },
                  ),
                  new RadioListTile<int>(
                    title: Text(
                      widget.theory[_currentIndex].tqOption3,
                      style: TextStyle(fontSize: 20),
                    ),
                    activeColor: Colors.green,
                    value: 3,
                    groupValue: _answers[_currentIndex],
                    onChanged: (val) {
                      setState(() {
                        _answers[_currentIndex] = 3;
                      });
                    },
                  ),
                  new RadioListTile<int>(
                    title: Text(
                      widget.theory[_currentIndex].tqOption4,
                      style: TextStyle(fontSize: 20),
                    ),
                    activeColor: Colors.green,
                    value: 4,
                    groupValue: _answers[_currentIndex],
                    onChanged: (val) {
                      setState(() {
                        _answers[_currentIndex] = 4;
                      });
                    },
                  )
                ]),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // ignore: deprecated_member_use
              child: RaisedButton(
                splashColor: Colors.blue,
                elevation: 5.0,
                color: _currentIndex ==
                        (widget.theory.length + 1 - widget.theory.length - 1)
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
                          (widget.theory.length + 1 - widget.theory.length - 1)
                      // ignore: unnecessary_statements
                      ? null
                      : _previous();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              // ignore: deprecated_member_use
              child: RaisedButton(
                splashColor: Colors.blue,
                elevation: 5.0,
                color: new Color(0xFF34A853),
                child: Text(
                  _currentIndex == (widget.theory.length - 1)
                      ? "Submit"
                      : "Next",
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  _next();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.0,
        ),
        Center(
          child: Container(
            // ignore: deprecated_member_use
            child: RaisedButton(
              splashColor: Colors.blue,
              elevation: 5.0,
              color: kBlackAccent,
              child: Text(
                'Summary',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SummaryPage(
                              theory: widget.theory,
                              answers: _answers,
                            )));
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
                side: BorderSide(color: Colors.blueAccent),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _next() async {
    if (_answers[_currentIndex] == null) {
      setState(() {
        _answers[_currentIndex] = 0;
      });
    }
    if (_currentIndex < (widget.theory.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      /* List data = [];
      for (int i = 0; i < widget.theory.length; i++)
        FirebaseFirestore.instance.collection('TheoryMark').doc().set({
          'Nos': widget.theory[i].tqNos,
          'slno': widget.theory[i].tqCode,
          'Question': widget.theory[i].tqQuestion,
          'correctAnswer': widget.theory[i].tqCorrectAnswer,
          'givenAnswer': this._answers[i],
          'MarksGiven':
              widget.theory[i].tqCorrectAnswer == this._answers[i] ? 1 : 0,
          'candidateID': '123',
          'candidateName': 'Abc',
          'UploadDate&Time': FieldValue.serverTimestamp()
        });*/
      try {
        var tempManipulatedData = {};
        CenterAssesor centerAssesor =
            Provider.of<CenterAssesor>(context, listen: false);
        this._answers.forEach((index, value) {
          var quesObj = this.widget.theory[index];
          String tqNos = quesObj.tqNos;
          if (tqNos == null) {
            tqNos = "0";
          }
          if (tempManipulatedData[tqNos] == null) {
            tempManipulatedData[tqNos] = PracticalResult.fromJson({
              'prId': 0,
              'prbatchId': this.widget.busy ? 1 : centerAssesor.asId,
              'prCandidateId': this.widget.busy
                  ? '123'
                  : this.widget.candidate.clEnrollmentNo,
              'prQuestionId': 0,
              'prMarks': 0,
              'prNos': quesObj.tqNos,
              'prType': true,
            });
          }
          tempManipulatedData[tqNos].prQuestionId =
              tempManipulatedData[tqNos].prQuestionId + 1;
          if (quesObj.tqCorrectAnswer == value)
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
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) => AlertDialog(
                      title: Text("Completed"),
                      content: Text("Theory exam was completed successfully"),
                      actions: <Widget>[
                        // ignore: deprecated_member_use
                        FlatButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              widget.busy
                                  ? _navigationService.navigateTo(RPL5Login)
                                  : _navigationService
                                      .navigateTo(ThirdViewRoute);
                            })
                      ],
                    )));
      } catch (e) {
        print(e);
      }
    }
  }

  void _previous() {
    if (_currentIndex <= (widget.theory.length - 1)) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  void notRec() async {
    if (_answers[_currentIndex] == null) {
      setState(() {
        _answers[_currentIndex] = 0;
      });
    }
    if (_currentIndex < (widget.theory.length - 1)) {
      var tempManipulatedData = {};
      CenterAssesor centerAssesor =
          Provider.of<CenterAssesor>(context, listen: false);
      this._answers.forEach((index, value) {
        var quesObj = this.widget.theory[index];
        String tqNos = quesObj.tqNos;
        if (tqNos == null) {
          tqNos = "0";
        }
        if (tempManipulatedData[tqNos] == null) {
          tempManipulatedData[tqNos] = PracticalResult.fromJson({
            'prId': 0,
            'prbatchId': this.widget.busy ? 1 : centerAssesor.asId,
            'prCandidateId':
                this.widget.busy ? '123' : this.widget.candidate.clEnrollmentNo,
            'prQuestionId': 0,
            'prMarks': 0,
            'prNos': quesObj.tqNos == null ? 'null' : tqNos,
            'prType': true,
          });
        }
        tempManipulatedData[tqNos].prQuestionId =
            tempManipulatedData[tqNos].prQuestionId + 1;
        if (quesObj.tqCorrectAnswer == value)
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
      await _api.updateTheory(list).whenComplete(() => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
                title: Text("Completed"),
                content: Text("Theory exam was completed successfully"),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.busy
                          ? _navigationService.navigateTo(RPL5Login)
                          : _navigationService.navigateTo(ThirdViewRoute);
                    },
                  )
                ],
              )));
    } else {
      print("vkugkgv");
    }
  }

  Future<void> _disqualified() async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'You are disqualified !',
            style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Sorry",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'OK',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w800),
              ),
              onPressed: () {
                notRec();
              },
            ),
          ],
        );
      },
    );
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
}
