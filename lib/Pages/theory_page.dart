import 'package:Scaleindia/ViewModels/theory_viewmodal.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/options_widget.dart';
import 'package:Scaleindia/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class TheoryPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TheoryPageViewModel>.reactive(
      viewModelBuilder: () => TheoryPageViewModel(),
      builder: (context, modal, child) => Scaffold(
        key: _key,
        appBar: PreferredSize(
            child: header(context,
                isAppTitle: false, isIcon: false, strTitle: "Theory Exam"),
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
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Candidate ID:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                TextSpan(
                                    text: "1234567890",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold)),
                              ])),
                            ),
                            Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Time Left:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                TimerLeft()
                              ],
                            ),
                            Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Card(
                              color: Colors.black,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 15.0,
                                    left: 16.0,
                                    right: 16.0),
                                child: Text(
                                  "1) " +
                                      "____________ consists of instructions of the work to be carried out by basic closing operator",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Options(),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 50,
                                  width: 140,
                                  child: RaisedButton(
                                    splashColor: Colors.blue,
                                    elevation: 5.0,
                                    color: new Color(0xFFEA4335),
                                    child: Text(
                                      'Previous',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 50,
                                  width: 140,
                                  child: RaisedButton(
                                    splashColor: Colors.blue,
                                    elevation: 5.0,
                                    color: new Color(0xFF34A853),
                                    child: Text(
                                      'Next',
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Center(
                              child: Container(
                                height: 50,
                                width: 140,
                                child: RaisedButton(
                                  splashColor: Colors.blue,
                                  elevation: 5.0,
                                  color: Colors.black87,
                                  child: Text(
                                    'Summary',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    modal.navigateToSummary();
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    side: BorderSide(color: Colors.blueAccent),
                                  ),
                                ),
                              ),
                            )
                          ]),
                    ),
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
