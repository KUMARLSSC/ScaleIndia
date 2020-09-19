import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CandidateWidget extends StatelessWidget {
  final Candidate candidate;
  CandidateWidget({this.candidate});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
         candidate.clEnrollmentNo,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 16.0,
          ),
        ),
        Text(
          candidate.clName,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 15.0,
          ),
        ),
        Container(
          height: 30,
          width: 80,
          child: RaisedButton(
            splashColor: Colors.blue,
            elevation: 3.0,
            color: new Color(0xffffffff),
            child: Text(
              'Start',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.blueAccent,
              ),
            ),
            onPressed: () {
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        )
      ],
    );
  }
}
