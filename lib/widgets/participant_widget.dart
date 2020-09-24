import 'package:Scaleindia/ApiModel/candidate_api.dart';

import 'package:flutter/material.dart';

class ParticipantWidget extends StatelessWidget {
  final Candidate candidate;
  ParticipantWidget({
    this.candidate,
  });
  @override
  Widget build(BuildContext context) {
    final  theory = true;
    final practical = true;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          candidate.clEnrollmentNo,
          maxLines: 2,
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
          child: (candidate.clPracticalDone &&candidate.clTheoryDeone) ==(practical==theory)
              ? RaisedButton(
                  splashColor: Colors.blue,
                  elevation: 3.0,
                  color: Colors.black12,
                  child: Text(
                    'Completed',
                    style: TextStyle(
                      fontSize: 9.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                )
              : RaisedButton(
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
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                )
        )
      ],
    );
  }
}
