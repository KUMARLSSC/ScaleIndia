import 'package:flutter/material.dart';
import 'EmployerDashBoard/employerregister_widget.dart';

class EmployerRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Image.asset(
                      "assets/img/logo.png",
                      fit: BoxFit.fill,
                      height: 100,
                      width: 250,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    "Employer/Company Registration Form",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  EmployerRegisterWidget(),
                  new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                ]),
          )),
    );
  }
}
