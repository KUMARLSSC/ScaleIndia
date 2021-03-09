import 'dart:async';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Pages/assessment/theory_viewmodal.dart';
import 'package:Scaleindia/Pages/assessment/options_widget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class TheoryPage extends StatefulWidget {
  final Candidate candidate;
  final Theory theory;
  final CenterAssesor centerAssesor;
  CameraController cameraController;
  int notReccount = 0;
  TheoryPage(
      {this.candidate,
      this.theory,
      this.centerAssesor,
      this.notReccount,
      this.cameraController});
  @override
  _TheoryPageState createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<TheoryPageViewModel>.reactive(
      onModelReady: (model) => model.getTheory(centerAssesor.asId),
      viewModelBuilder: () => TheoryPageViewModel(),
      builder: (context, modal, child) => WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Candidate ID:",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)),
                            TextSpan(
                                text: this.widget.candidate.clEnrollmentNo,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold)),
                          ])),
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        modal.busy == false
                            ? Center(
                                child: ColorLoader3(
                                radius: 20.0,
                                dotRadius: 10.0,
                              ))
                            : SingleChildScrollView(
                                child: Options(
                                theory: modal.posts,
                                theory1: widget.theory,
                                candidate: widget.candidate,
                                notReccount: this.widget.notReccount,
                                cameraController: this.widget.cameraController,
                              )),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                    "Are you sure you want to quit the Exam? All your progress will be lost."),
                title: Text("Warning!"),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              );
            })) ??
        false;
  }
}
