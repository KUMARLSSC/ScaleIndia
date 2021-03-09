import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';

File imageFile;

class BottomSheetWidget extends StatefulWidget {
  final Function onPressed;
  const BottomSheetWidget({this.onPressed});
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: deprecated_member_use
        RaisedButton(
          splashColor: Colors.blue,
          elevation: 5.0,
          color: kBlackAccent,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Upload photo',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          onPressed: this.widget.onPressed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.blueAccent),
          ),
        ),
        /*SizedBox(
          height: 5.0,
        ),
        Text(
          '&',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5.0,
        ),
        RaisedButton(
          splashColor: Colors.blue,
          elevation: 5.0,
          color: kBlackAccent,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Upload your photo',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 24.0,
              ),
            ],
          ),
          onPressed: () {
            takePhotoByCamera();
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: Colors.blueAccent),
          ),
        ),*/
      ],
    );
  }
}
