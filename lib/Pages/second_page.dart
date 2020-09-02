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
              SizedBox(
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
                            "Select an Language:",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(
                              title: "English",
                              onPressed: () {
                                model.navigateToThirdPage();
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "தமிழ்", onPressed:() {
                                model.navigateToThirdPage();
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "हिन्दी", onPressed:() {
                                model.navigateToThirdPage();
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "తెలుగు", onPressed: () {
                                model.navigateToThirdPage();
                              }),
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
