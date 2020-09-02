import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: header(context, isAppTitle: true,isIcon: false), preferredSize: Size.fromHeight(47.0)),
      body: null,
    );
  }
}