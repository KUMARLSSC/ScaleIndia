import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';

class TheoryPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
              child: header(context, isAppTitle: false, isIcon: false,strTitle: "Theory Exam"),
              preferredSize: Size.fromHeight(50.0)),
              body: Container(),
    );
  }
}