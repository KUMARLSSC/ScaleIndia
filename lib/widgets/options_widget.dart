import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Pages/summary_page.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class Options extends StatefulWidget {
  final List<Theory> theory;
  Options({
    Key key,
    this.theory,
  }) : super(key: key);
  @override
  _OptionsState createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final DialogService _dialogService = locator<DialogService>();
  final Map<int, dynamic> _answers = {};
  int _currentIndex = 0;
  setSelectedUser(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            widget.theory[_currentIndex].tqImg != null? Image.network(
                                          widget.theory[_currentIndex].tqImg,
                                          fit: BoxFit.fill,
                                        ):Container()
              ],
            )
          ),
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
                    value: 0,
                    groupValue: _answers[_currentIndex],
                    onChanged: (val) {
                      setState(() {
                        _answers[_currentIndex] = 0;
                      });
                    },
                  ),
                  new RadioListTile<int>(
                    title: Text(
                      widget.theory[_currentIndex].tqOption2,
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
                      widget.theory[_currentIndex].tqOption3,
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
                      widget.theory[_currentIndex].tqOption4,
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
                      :_previous();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            const SizedBox(width: 20,),
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
                onPressed: () {
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
        )
      ],
    );
  }

  void _next() {
    if (_answers[_currentIndex] == null) {
      _dialogService.showDialog(
        title: 'Failed',
        description: "You must select an answer to continue.",
      );
      return;
    }
    if (_currentIndex < (widget.theory.length-1)) {
      setState(() {
        _currentIndex++;
      });
    }else {
      _dialogService.showDialog(
        title: 'Completed',
        description: "Theory Exam Completed",
      );
    }
  }

  void _previous() {
    if (_currentIndex < (widget.theory.length - 1)) {
      setState(() {
        _currentIndex--;
      });
    }
  }
}
