import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';

class LangugaePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: header(context, isAppTitle: true, isIcon: false),
          preferredSize: Size.fromHeight(50.0)),
          body: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Select an Language:",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(
                              title: "English",
                              onPressed: () {
                               
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "தமிழ்", onPressed:() {
                               
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "हिन्दी", onPressed:() {
                               
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "తెలుగు", onPressed: () {
                              
                              }),
                        ],
                      ),
    );
  }
}
