import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Pages/fifth_page.dart';
import 'package:Scaleindia/ViewModels/fourthpage_viewmodel.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ParticipantWidget extends StatelessWidget {
  final Candidate candidate;
  final CenterAssesor centerAssesor;
  ParticipantWidget({this.candidate, this.centerAssesor});
  @override
  Widget build(BuildContext context) {
    final theory = true;
    final practical = true;
    return ViewModelBuilder<FourthPageViewModel>.reactive(
      viewModelBuilder: () => FourthPageViewModel(),
      builder: (context, model, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 120,
            child: Text(
              candidate.clEnrollmentNo,
              maxLines: 2,
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
              ),
            ),
          ),
          Container(
            width: 145,
            child: Text(
              candidate.clName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
              ),
            ),
          ),
          Container(
              height: 30,
              width: 80,
              child: (candidate.clPracticalDone && candidate.clTheoryDeone) ==
                      (practical == theory)
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
                      onPressed: () {
                        model.navigateToCompleted();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    )
                  : RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 3.0,
                      color: Colors.green,
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FifthPage(
                                      candidate: candidate,
                                      centerAssesor: centerAssesor,
                                    )));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ))
        ],
      ),
    );
  }
}
