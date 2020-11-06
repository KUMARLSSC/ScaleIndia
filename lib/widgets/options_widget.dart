import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/ApiModel/theory_result_api.dart';
import 'package:Scaleindia/Pages/first_page.dart';
import 'package:Scaleindia/Pages/summary_page.dart';
import 'package:Scaleindia/Services/api_services.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../locator.dart';

class Options extends StatefulWidget {
  final List<Theory> theory;
  final Theory theory1;
  final Candidate candidate;

  final TheoryResult theoryResult;
  Options(
      {Key key, this.theory1, this.theoryResult, this.theory, this.candidate})
      : super(key: key);
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final DialogService _dialogService = locator<DialogService>();
  final Map<int, dynamic> _answers = {};
  final Api _api = locator<Api>();
  int _currentIndex = 0;
  setSelectedUser(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              height: MediaQuery.of(context).size.height - 665,
              width: MediaQuery.of(context).size.width - 220,
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
              height: MediaQuery.of(context).size.height - 665,
              width: MediaQuery.of(context).size.width - 220,
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
            height: MediaQuery.of(context).size.height - 665,
            width: MediaQuery.of(context).size.width - 220,
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
      _dialogService.showDialog(
        title: 'Failed',
        description: "You must select an answer to continue.",
      );
      return;
    }
    if (_currentIndex < (widget.theory.length - 1)) {
      setState(() {
        _currentIndex++;
      });
    } else {
      int correct = 0;
      List tableResult = [];
      this._answers.forEach((index, value) {
        if (this.widget.theory[index].tqCorrectAnswer == value) correct++;
      });
      Theory question1 = this.widget.theory[0];
      bool correct1 = question1.tqCorrectAnswer == _answers[0];
      Theory question2 = this.widget.theory[1];
      bool correct2 = question2.tqCorrectAnswer == _answers[1];
      Theory question3 = this.widget.theory[2];
      bool correct3 = question3.tqCorrectAnswer == _answers[2];
      Theory question4 = this.widget.theory[3];
      bool correct4 = question4.tqCorrectAnswer == _answers[3];
      Theory question5 = this.widget.theory[4];
      bool correct5 = question5.tqCorrectAnswer == _answers[4];
      Theory question6 = this.widget.theory[5];
      bool correct6 = question6.tqCorrectAnswer == _answers[5];
      Theory question7 = this.widget.theory[6];
      bool correct7 = question7.tqCorrectAnswer == _answers[6];
      Theory question8 = this.widget.theory[7];
      bool correct8 = question8.tqCorrectAnswer == _answers[7];
      Theory question9 = this.widget.theory[8];
      bool correct9 = question9.tqCorrectAnswer == _answers[8];
      Theory question10 = this.widget.theory[9];
      bool correct10 = question10.tqCorrectAnswer == _answers[9];
      Theory question11 = this.widget.theory[10];
      bool correct11 = question11.tqCorrectAnswer == _answers[10];
      Theory question12 = this.widget.theory[11];
      bool correct12 = question12.tqCorrectAnswer == _answers[11];
      Theory question13 = this.widget.theory[12];
      bool correct13 = question13.tqCorrectAnswer == _answers[12];
      Theory question14 = this.widget.theory[13];
      bool correct14 = question14.tqCorrectAnswer == _answers[13];
      Theory question15 = this.widget.theory[14];
      bool correct15 = question15.tqCorrectAnswer == _answers[14];
      Theory question16 = this.widget.theory[15];
      bool correct16 = question16.tqCorrectAnswer == _answers[15];
      Theory question17 = this.widget.theory[16];
      bool correct17 = question17.tqCorrectAnswer == _answers[16];
      Theory question18 = this.widget.theory[17];
      bool correct18 = question18.tqCorrectAnswer == _answers[17];
      Theory question19 = this.widget.theory[18];
      bool correct19 = question19.tqCorrectAnswer == _answers[18];
      Theory question20 = this.widget.theory[19];
      bool correct20 = question20.tqCorrectAnswer == _answers[19];
      CenterAssesor centerAssesor =
          Provider.of<CenterAssesor>(context, listen: false);

      await _api
          .updateTheory(
              this.widget.candidate.clEnrollmentNo,
              centerAssesor.asId,
              correct1 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct2 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct3 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct4 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct5 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct6 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct7 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct8 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct9 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct10 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct11 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct12 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct13 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct14 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct15 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct16 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct17 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct18 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct19 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct20 ? this.widget.theory[_currentIndex].tqMarks : 0,
              correct,
              null,
              tableResult)
          .whenComplete(() => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text("Completed"),
                    content: Text("Theory exam was completed successfully"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FirstPage()),
                          );
                        },
                      )
                    ],
                  )));
    }
  }

  void _previous() {
    if (_currentIndex <= (widget.theory.length - 1)) {
      setState(() {
        _currentIndex--;
      });
    }
  }
}
