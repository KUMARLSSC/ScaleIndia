import 'dart:async';
import 'package:Scaleindia/Pages/Assessor/tasks.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'assessor_viewmodel.dart';

class SOP extends StatelessWidget {
  Future<void> _rules(BuildContext context) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Read the content'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Content"),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer.run(() => _rules(context));
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
        viewModelBuilder: () => AssessorPageViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: PreferredSize(
                child: header(context,
                    isAppTitle: false,
                    isIcon: false,
                    icon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Color(0xffE6E6E6),
                        child: Icon(
                          Icons.person,
                          color: Color(0xffCCCCCC),
                        ),
                      ),
                    ),
                    centerTitle: true,
                    disappearedBackButton: false,
                    action: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.notifications),
                      )
                    ],
                    strTitle: "SOP TASK"),
                preferredSize: Size.fromHeight(50.0)),
            body: Tasks()));
  }
}
