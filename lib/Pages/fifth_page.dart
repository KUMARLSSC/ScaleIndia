import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Pages/language_page1.dart';
import 'package:Scaleindia/Pages/langugae_page.dart';
import 'package:Scaleindia/ViewModels/fifthpage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FifthPage extends StatelessWidget {
  final Candidate candidate;
  final CenterAssesor centerAssesor;
  FifthPage({this.candidate, this.centerAssesor});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => _asyncSimpleDialog(context));
    final theory = true;
    final practical = true;
    return ViewModelBuilder<FifthPageViewModel>.reactive(
      viewModelBuilder: () => FifthPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
            child: header(context, isAppTitle: true, isIcon: false),
            preferredSize: Size.fromHeight(50.0)),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(7),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Start Your Practical and Theory Assessment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        Center(
                          child: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Candidate ID:",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 17)),
                            TextSpan(
                                text: candidate.clEnrollmentNo,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold)),
                          ])),
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height - 240.0,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Center(
                                    child: Text(
                                  "Instruction",
                                  style: TextStyle(
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "•The Assessment is of 60 mintues",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "• It is a multiple choice question with no negative marking",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(
                                  child: Text(
                                    "• For any issue contact the Assessor",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height -
                                        665,
                                    width:
                                        MediaQuery.of(context).size.width - 220,
                                    child: candidate.clTheoryDeone == theory
                                        ? RaisedButton(
                                            splashColor: Colors.blue,
                                            elevation: 3.0,
                                            color: Colors.black12,
                                            child: Text(
                                              'Theory',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              model.navigateToTheory();
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          )
                                        : RaisedButton(
                                            splashColor: Colors.blue,
                                            elevation: 5.0,
                                            color: new Color(0xFFEA4335),
                                            child: Text(
                                              'Theory',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LanguagePage(
                                                            candidate:
                                                                candidate,
                                                            centerAssesor:
                                                                centerAssesor,
                                                          )));
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height -
                                        665,
                                    width:
                                        MediaQuery.of(context).size.width - 220,
                                    child: candidate.clPracticalDone ==
                                            practical
                                        ? RaisedButton(
                                            splashColor: Colors.blue,
                                            elevation: 3.0,
                                            color: Colors.black12,
                                            child: Text(
                                              'Practical',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              model.navigateToPractical();
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          )
                                        : RaisedButton(
                                            splashColor: Colors.blue,
                                            elevation: 5.0,
                                            color: new Color(0xFF34A853),
                                            child: Text(
                                              'Practical',
                                              style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LanguagePage1(
                                                            candidate:
                                                                candidate,
                                                          )));
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ])),
            ],
          ),
        ),
      ),
    );
  }

  void _asyncSimpleDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: const Text(
                  'Please upload your Aadharcard & photo to continue '),
              children: [
                BottomSheetWidget1(
                  candidate: candidate,
                ),
                FlatButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                )
              ]);
        });
  }
}
