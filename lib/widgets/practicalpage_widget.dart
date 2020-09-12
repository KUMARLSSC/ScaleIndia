import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';

class PracticalPageWidget extends StatefulWidget {
  @override
  _PracticalPageWidgetState createState() => _PracticalPageWidgetState();
}

class _PracticalPageWidgetState extends State<PracticalPageWidget> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 80,
          color: Colors.grey[350],
          child: Center(
            child: Text(
              "1:" +
                  "Select the right sewing machine .threads and bobbins for the materials as per the specifications in the job card. ",
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
          splashColor: Colors.red,
          color: Colors.green,
        ),
        SizedBox(
          height: 15,
        ),
        Text("Max Marks: 10",style: TextStyle(fontSize: 17),),
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
                            height: 86,
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
                                  padding: Ed,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: InputField(
                                    placeholder: 'Mark',
                                    controller: textController,
                                  ),
                                ),
                          ),
      ],
    );
  }
}
