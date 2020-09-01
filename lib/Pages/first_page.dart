import 'package:Scaleindia/ViewModels/firstpage_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class FirstPage extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FirstPageViewModel>.reactive(
      viewModelBuilder: () => FirstPageViewModel(),
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
                            "Request ID:",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(32, 132, 232, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey[200]))),
                                  child: InputField(
                                    placeholder: 'Enter your request id',
                                    controller: textController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          BusyButton(
                            title: 'Start',
                            busy: model.busy,
                            onPressed: () {
                              model.firstpage(requestid: textController.text );
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
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
