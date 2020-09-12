import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:flutter/material.dart';

import '../locator.dart';

class SumbitButton extends StatefulWidget {
  @override
  _SumbitButtonState createState() => _SumbitButtonState();
}

class _SumbitButtonState extends State<SumbitButton> {
  final DialogService _dialogService = locator<DialogService>();
  bool isEnabled = true;

  enableButton() {
    setState(() {
      isEnabled = true;
    });
  }

  sampleFunction() {
    print('Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 140,
      child: RaisedButton(
        splashColor: Colors.blue,
        elevation: 5.0,
        child: Text(
          'Submit',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        onPressed: isEnabled
            ? () => _dialogService.showDialog(
                  title: "Failed",
                  description:
                      'Please complete all the questions or check whether you attened all the questions or not',
                )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}
