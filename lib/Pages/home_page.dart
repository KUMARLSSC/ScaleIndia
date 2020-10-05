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
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),
                        child: Image.asset(
                          "assets/img/scale.png",
                          fit: BoxFit.fill,
                          height: 100,
                          width: 180,
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
                    child: ConnectionCheck(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(10),
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
                                  model.navigateToEmployerPage();
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
                                  model.handleStartUpLogic();
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              BusyButton(
                                title: 'Trainer',
                                busy: model.busy,
                                color: Colors.green,
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              BusyButton(
                                title: 'Assesor',
                                busy: model.busy,
                                color: Colors.green,
                                onPressed: () {},
                              ),
                              new Padding(
                                  padding: EdgeInsets.only(bottom: 20.0)),
                            ],
                          ),
                        ),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
