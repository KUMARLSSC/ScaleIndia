import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/ViewModels/theory_viewmodal.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/options_widget.dart';
import 'package:Scaleindia/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class TheoryPage extends StatefulWidget {
  final Candidate candidate;
  final Theory theory;
  final CenterAssesor centerAssesor;
  TheoryPage({this.candidate, this.theory, this.centerAssesor});
  @override
  _TheoryPageState createState() => _TheoryPageState();
}

class _TheoryPageState extends State<TheoryPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<TheoryPageViewModel>.reactive(
        onModelReady: (model) => model.getTheory(centerAssesor.asId),
        viewModelBuilder: () => TheoryPageViewModel(),
        builder: (context, modal, child) => WillPopScope(
              onWillPop: _onWillPop,
              child: Scaffold(
                key: _key,
                appBar: PreferredSize(
                    child: header(context,
                        isAppTitle: false,
                        isIcon: false,
                        strTitle: "Theory Assessment"),
                    preferredSize: Size.fromHeight(50.0)),
                body: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
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
                                      child: Text.rich(TextSpan(children: [
                                        TextSpan(
                                            text: "Candidate ID:",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20)),
                                        TextSpan(
                                            text: this
                                                .widget
                                                .candidate
                                                .clEnrollmentNo,
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("Time Left:",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18)),
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
                                    Container(
                                      height: 500,
                                      child: modal.busy == false
                                          ? Center(
                                              child: CircularProgressIndicator(
                                                backgroundColor: Colors.white,
                                              ),
                                            )
                                          : SingleChildScrollView(
                                              child: Options(
                                              theory: modal.posts,
                                              theory1: widget.theory,
                                              candidate: widget.candidate,
                                            )),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Future<bool> _onWillPop() async {
    return showDialog<bool>(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Text(
                "Are you sure you want to quit the Exam? All your progress will be lost."),
            title: Text("Warning!"),
            actions: <Widget>[
              FlatButton(
                child: Text("Yes"),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text("No"),
                onPressed: () {
                  Navigator.pop(context, false);
                },
              ),
            ],
          );
        });
  }
}
