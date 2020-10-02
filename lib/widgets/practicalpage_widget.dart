import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ViewModels/practicalpage_viewmodel.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PracticalPageWidget extends StatelessWidget {
  final textController = TextEditingController();
  final int _currentIndex = 0;
  final Practical practical;
  PracticalPageWidget({this.practical});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PracticalPageViewModel>.reactive(
      viewModelBuilder: () => PracticalPageViewModel(),
      builder: (context, model, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
                      height: 45,
                      color: Colors.lightBlue,
                      child: Center(
                        child: Text(
                          practical.pqNos,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
          Container(
            height: 80,
            color: Colors.grey[350],
            child: Center(
              child: Text(
                practical.pqQuestion,
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
            color: Colors.green,
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
            style: kTitleStyle,
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
              height: 80,
              width: 150,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 1),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[200]))),
              child: InputField(
                placeholder: 'Mark',
                controller: textController,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
