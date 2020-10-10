import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/ViewModels/practicalpage_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/input_field.dart';

import '../locator.dart';

class PracticalPageWidget extends StatefulWidget {
  final List<Practical> practical;
  PracticalPageWidget({this.practical});
  @override
  _PracticalPageWidgetState createState() => _PracticalPageWidgetState();
}

class _PracticalPageWidgetState extends State<PracticalPageWidget> {
  final DialogService _dialogService = locator<DialogService>();
  final TextEditingController textController = TextEditingController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PracticalPageViewModel>.reactive(
      viewModelBuilder: () => PracticalPageViewModel(),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
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
            height: 30,
          ),
          Container(
            height: 92,
            color: kBlackAccent,
            child: Center(
              child: Text(
               widget.practical[_currentIndex].pqCommonQuestion !=null? widget.practical[_currentIndex].pqCommonQuestion:"",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            child: Center(
              child: Text(
              "${_currentIndex + 1}: " + widget.practical[_currentIndex].pqQuestion,
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
          RaisedButton.icon(
            onPressed: () {
              print('Button Clicked.');
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
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
            color: Colors.black,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Max Marks: 10",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Enter Marks:",
           style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 80,
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
              height: 70,
              width: 150,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200]))),
              child: InputField(
                placeholder: 'Mark',
                text1InputType: TextInputType.number,
                controller: textController,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 140,
                child: RaisedButton(
                  splashColor: Colors.blue,
                  elevation: 5.0,
                  color: _currentIndex == (widget.practical.length+1 - widget.practical.length-1 )? Colors.white30:new Color(0xFFEA4335),
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
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 140,
                child: RaisedButton(
                  splashColor: Colors.blue,
                  elevation: 5.0,
                  color: new Color(0xFF34A853),
                  child: Text(
                   _currentIndex == (widget.practical.length - 1)? "Submit":"Next",
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
        ],
      ),
    );
  }

  void _nextSubmit({@required String mark}) {
    if ([_currentIndex] == null) {
      _dialogService.showDialog(
        title: 'Failed',
        description: "You must select an answer to continue.",
      );
      return;
    }else if(
      mark.isEmpty
    ){
      _dialogService.showDialog(
        title: 'Failed',
        description: "You must select an answer to continue.",
      );
      return;
    }
    if (_currentIndex < (widget.practical.length)) {
      setState(() {
        _currentIndex++;
      });
    }else {
     _dialogService.showDialog(
        title: 'Completed',
        description: "Practical Exam Completed",
      );
    }
  }

  void _previous() {
    if (_currentIndex < (widget.practical.length --)) {
      setState(() {
        _currentIndex--;
      });
    }
  }
   
}
