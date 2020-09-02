import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
              child: header(context, isAppTitle: true, isIcon: false),
              preferredSize: Size.fromHeight(50.0)),
              body: null,
    );
  }
}