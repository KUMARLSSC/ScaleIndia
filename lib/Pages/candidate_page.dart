import 'package:Scaleindia/ViewModels/candidatePage_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CandidatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CandidatePageViewModel>.reactive(
      viewModelBuilder: () => CandidatePageViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue[900],
            Colors.blue[800],
            Colors.blue[400]
          ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0),
                          bottomLeft: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                        child: Image.asset(
                          "assets/img/scale.png",
                          fit: BoxFit.fill,
                          height: 155,
                          width: 450,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Text(
                        "Welcomes You",
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 15),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Select:",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(
                            title: 'Assessment',
                            busy: model.busy,
                            onPressed: () {
                              model.navigateToFirstPage();
                            },
                          ),
                          Center(
                              child: Text(
                            "&",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          BusyButton(
                            title: 'E-Learning',
                            busy: model.busy,
                            onPressed: () {
                              model.navigateToELearningPage();
                            },
                          ),
                          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
