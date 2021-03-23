import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/assessment/candidatePage_viewmodel.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/locator.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class Rpl4Category extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CandidatePageViewModel>.reactive(
        viewModelBuilder: () => CandidatePageViewModel(),
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
              body: Column(
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(1),
                          child: Column(
                            children: <Widget>[
                              Center(
                                  child: Text(
                                "Rpl-4 Users",
                                style: kTitleStyle,
                              )),
                              SizedBox(
                                height: 15,
                              ),
                              BusyButton(
                                title: 'Candidate',
                                busy: model.busy,
                                color: Colors.green,
                                onPressed: () {
                                  model.navigateToRPL4CandidateLoginPage();
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              BusyButton(
                                title: 'Admin',
                                busy: model.busy,
                                color: Colors.green,
                                onPressed: () {
                                  model.navigateToRPL4AdminLogin();
                                },
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              new Padding(
                                  padding: EdgeInsets.only(bottom: 20.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            onWillPop: () => _onWillPop()));
  }

  Future<bool> _onWillPop() async {
    return _navigationService.navigateTo(CandidateViewRoute);
  }
}
