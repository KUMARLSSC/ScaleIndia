import 'package:Scaleindia/Pages/Assessor/assessor_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SopTask extends StatefulWidget {
  @override
  _SopTaskState createState() => _SopTaskState();
}

class _SopTaskState extends State<SopTask> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
        viewModelBuilder: () => AssessorPageViewModel(),
        builder: (context, model, child) => Container(
              width: 280.0,
              margin: const EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: kBlack,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                      "SOP TASK",
                      style: kTitleStyle.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Task 1 :    ",
                            style: kSubtitleStyle.copyWith(
                                color: Colors.white, fontSize: 20),
                          ),
                          TextSpan(
                            text: "Pending",
                            style: kSubtitleStyle.copyWith(
                                color: Colors.red, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Task 2 :    ",
                            style: kSubtitleStyle.copyWith(
                                color: Colors.white, fontSize: 20),
                          ),
                          TextSpan(
                            text: "Pending",
                            style: kSubtitleStyle.copyWith(
                                color: Colors.red, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Task 3 :    ",
                            style: kSubtitleStyle.copyWith(
                                color: Colors.white, fontSize: 20),
                          ),
                          TextSpan(
                            text: "Pending",
                            style: kSubtitleStyle.copyWith(
                                color: Colors.red, fontSize: 20),
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
                      style: TextStyle(fontSize: 15.0, color: Colors.white),
                    ),
                    onPressed: () {
                      model.navigateToActivate();
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
