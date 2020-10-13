import 'package:Scaleindia/ViewModels/home_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/internet_connection.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
      viewModelBuilder: () => HomePageViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/img/logo.png",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Welcomes You",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: ConnectionCheck(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                          "Select your role in ScaleIndia",
                          style: kTitleStyle,
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: "Employer",
                          color: Colors.green,
                          busy: model.busy,
                          onPressed: () {
                            model.handleStartUpLogicEmployer();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Candidate',
                          color: Colors.green,
                          busy: model.busy,
                          onPressed: () {
                            model.navigateToFirstPage();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Employee',
                          busy: model.busy,
                          color: Colors.green,
                          onPressed: () {
                            model.handleStartUpLogicEmployee();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Trainer',
                          busy: model.busy,
                          color: Colors.green,
                          onPressed: () {
                            model.navigateToTrainerLoginPage();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Assessor',
                          busy: model.busy,
                          color: Colors.green,
                          onPressed: () {
                            model.navigateToAssessorLoginPage();
                          },
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'About Scale India',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
