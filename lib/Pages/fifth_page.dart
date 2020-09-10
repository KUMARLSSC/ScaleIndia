import 'package:Scaleindia/ViewModels/fifthpage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FifthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FifthPageViewModel>.reactive(
      viewModelBuilder: () => FifthPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
            child: header(context, isAppTitle: true, isIcon: false),
            preferredSize: Size.fromHeight(50.0)),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height - 30.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Colors.blue[900],
                    Colors.blue[800],
                    Colors.blue[400]
                  ]),
                ),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(7),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Text(
                                  'Start Your Practical and Theory Exam',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.limeAccent,
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
                                      text: "Enrollment ID:",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17)),
                                  TextSpan(
                                      text: "1234567890",
                                      style: TextStyle(
                                          color: Colors.white,
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
                                height:
                                    MediaQuery.of(context).size.height - 240.0,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Center(
                                          child: Text(
                                        "Instruction",
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "•The examination is of 60 mintues",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "• It is a multiple choicequestion with no negative marking",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "• For any issue contact the invagilator",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 50,
                                          width: 140,
                                          child: RaisedButton(
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
                                              model.navigateToTheory();
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: BorderSide(
                                                  color: Colors.blueAccent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 50,
                                          width: 140,
                                          child: RaisedButton(
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
                                              model.navigateToPractical();
                                            },
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                              side: BorderSide(
                                                  color: Colors.blueAccent),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Divider(
                                color: Colors.black38,
                                height: 15,
                              ),
                              SizedBox(
                                        height: 15.0,
                                      ),
                                      Center(
                                        child: Container(
                                          height: 150,
                                          width: 220,
                                          child: BottomShhetWidget(),
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
          ),
        ),
      ),
    );
  }
}
