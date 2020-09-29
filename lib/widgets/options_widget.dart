import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class Options extends StatefulWidget {
  final List<Theory> theory;
  Options({this.theory});
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
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 15.0, left: 16.0, right: 16.0),
            child: Text(
              "1: " + widget.theory[_currentIndex].tqQuestion,
              textAlign: TextAlign.justify,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 140,
              child: RaisedButton(
                splashColor: Colors.blue,
                elevation: 5.0,
                color: new Color(0xFFEA4335),
                child: Text(
                  'Previous',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  _previous();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 140,
              child: RaisedButton(
                splashColor: Colors.blue,
                elevation: 5.0,
                color: new Color(0xFF34A853),
                child: Text(
                  'Next',
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
            height: 50,
            width: 140,
            child: RaisedButton(
              splashColor: Colors.blue,
              elevation: 5.0,
              color: Colors.black87,
              child: Text(
                'Summary',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
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
        title: 'Given field is empty ',
        description: 'Please enter your request id',
      );
      return;
    }
    if (_currentIndex < (widget.theory.length - 1)) {
      setState(() {
        _currentIndex++;
      });
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
