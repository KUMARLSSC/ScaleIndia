import 'package:Scaleindia/ViewModels/secondpage_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SecondPage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SecondPageViewModel>.reactive(
      viewModelBuilder: () => SecondPageViewModel(),
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
                          "Select an Language to continue:",
                          style: kTitleStyle,
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                              child: Text(
                            "Select an Language:",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(
                              title: "English",
                              color: Colors.green,
                              onPressed: () {
                                model.navigateToThirdPage();
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "தமிழ்", color: Colors.green,onPressed:() {
                                model.navigateToThirdPage();
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "हिन्दी",color: Colors.green, onPressed:() {
                                model.navigateToThirdPage();
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "বাংলা", color: Colors.green,onPressed: () {
                                model.navigateToThirdPage();
                              }),
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
