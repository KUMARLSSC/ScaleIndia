import 'package:Scaleindia/Pages/EmployeeDashBoard/ecas_create_widget.dart';
import 'package:flutter/material.dart';

class ECASCreate extends StatelessWidget {
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
                    "Employee Candidate Sourcing",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  ECASCreatWidget(),
                  new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                ]),
          )),
    );
  }
}
