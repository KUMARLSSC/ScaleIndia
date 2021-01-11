import 'package:Scaleindia/List/company.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/busy_button.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'assessor_viewmodel.dart';

class AssessorWidget extends StatelessWidget {
  final Company company;
  AssessorWidget({this.company});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
        viewModelBuilder: () => AssessorPageViewModel(),
        builder: (context, model, child) => Container(
              width: 280.0,
              margin: EdgeInsets.only(right: 15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kBlack,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Batch ID: 1",
                        style: kTitleStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Date : 11-01-2021",
                        style: kTitleStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: Text(
                      "Status: Not Activated",
                      style: kTitleStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Time:10 am to 1 pm",
                            style: kSubtitleStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "  •  ",
                            style: kSubtitleStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Chennai",
                            style: kSubtitleStyle.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                      child: RaisedButton(
                    splashColor: Colors.blue,
                    elevation: 10.0,
                    color: Colors.grey,
                    child: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      model.navigateToSop();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ))
                ],
              ),
            ));
  }
}
