import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';

class ActivateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Please keep your face to front of the camera',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            Text(
              'The admin is checking you ',
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
            ),
            ColorLoader3(
              radius: 20.0,
              dotRadius: 10.0,
            )
          ],
        )));
  }
}
