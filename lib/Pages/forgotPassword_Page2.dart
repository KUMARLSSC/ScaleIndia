import 'package:Scaleindia/ViewModels/forgotPage2_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:Scaleindia/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ForgotPage2 extends StatelessWidget {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgotPage2ViewModel>.reactive(
      viewModelBuilder: () => ForgotPage2ViewModel(),
      builder: (context, model, child) =>  Scaffold(
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
                        "Reset Password",
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Column(
                        children: <Widget>[
                        Center(
                              child: Text(
                            "A password reset link has been sent to your email",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 30,
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
                                    placeholder: 'Email',
                                    controller: emailController,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          BusyButton(
                            title: 'Sumbit',
                            busy: model.busy,
                            color: Colors.green,
                            onPressed: () {
                              model.forgot(email: emailController.text);
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextLink(
                            'Return to Login In',
                            onPressed: () {
                              model.navigateBackToLogin();
                            },
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
