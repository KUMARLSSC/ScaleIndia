import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class TimerLeft extends StatefulWidget {
  @override
  _TimerLeftState createState() => _TimerLeftState();
}

class _TimerLeftState extends State<TimerLeft> {
  Duration _duration = Duration(minutes: 60);
  @override
  Widget build(BuildContext context) {
    return SlideCountdownClock(
      duration: _duration,
      separator: ':',
      textStyle: TextStyle(
        color: Colors.limeAccent,
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
