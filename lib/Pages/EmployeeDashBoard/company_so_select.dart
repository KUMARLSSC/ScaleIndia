import 'package:Scaleindia/ViewModels/employerPage_viewmodel.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompanySourcingSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployerPageViewModel>.reactive(
      viewModelBuilder: () => EmployerPageViewModel(),
      builder: (context, model, child) => Scaffold(
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
                      "Company Sourcing",
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
                          "Select:",
                          style: kTitleStyle,
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Register',
                          busy: model.busy,
                          color: Colors.green,
                          onPressed: () {
                            model.navigateToCsCreateView();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BusyButton(
                          title: 'View all',
                          busy: model.busy,
                          color: Colors.green,
                          onPressed: () {
                            model.navigateToCsHomeView();
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
    );
  }
}
