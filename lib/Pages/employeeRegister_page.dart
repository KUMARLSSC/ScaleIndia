import 'package:Scaleindia/widgets/employeeregister_widget.dart';
import 'package:flutter/material.dart';

class EmployeeRegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                      child: Image.asset(
                        "assets/img/logo.png",
                        fit: BoxFit.fill,
                        height: 80,
                        width: 150,
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
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                          "Leather Sector Skill Council",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        )),
                         SizedBox(
                          height: 3,
                        ),
                        Center(
                            child: Text(
                          "Employee Registration Form",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        EmployeeRegisterWidget(),       
                        new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                      ],
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
