import 'package:Scaleindia/Pages/EmployeeDashBoard/employeePage_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:Scaleindia/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EmployeePage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeePageViewModel>.reactive(
      viewModelBuilder: () => EmployeePageViewModel(),
      builder: (context, model, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
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
                  height: 20,
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
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                          "Employee Login",
                          style: kTitleStyle,
                        )),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 280,
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
                                  text1InputType: TextInputType.emailAddress,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Password',
                                  password: true,
                                  text1InputType: TextInputType.text,
                                  controller: passwordController,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextLink(
                          'Forgot Password',
                          onPressed: () {
                            model.navigateToForgotPage1();
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        BusyButton(
                          title: 'Login',
                          busy: model.busy,
                          color: Colors.green,
                          onPressed: () {
                            model.login(
                                email: emailController.text,
                                password: passwordController.text);
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Register',
                          color: Colors.blue[300],
                          onPressed: () {
                            model.navigateToEmployeeRegister();
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        BusyButton(
                          title: 'Sourcing',
                          color: Colors.brown[900],
                          onPressed: () {
                            model.navigateToCandidateSourcingView();
                          },
                        ),
                        new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
