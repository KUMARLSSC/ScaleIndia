import 'package:Scaleindia/ViewModels/employerPage_viewmodel.dart';
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
    return ViewModelBuilder<EmployerPageViewModel>.reactive(
      viewModelBuilder: () => EmployerPageViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Center(
              child: ClipRRect(
                child: Image.asset(
                  "assets/img/logo.png",
                  fit: BoxFit.fill,
                  height: 130,
                  width: 300,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Reset Password",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
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
                              width: 280,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
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
                        height: 25,
                      ),
                      TextLink(
                        'Return to Login In',
                        onPressed: () {
                          model.navigateBackToLogin();
                        },
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
