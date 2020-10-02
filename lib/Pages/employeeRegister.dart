import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/register_widget.dart';
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
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: Image.asset(
                        "assets/img/scale.png",
                        fit: BoxFit.fill,
                        height: 80,
                        width: 150,
                      ),
                    ),
                  )
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
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Center(
                            child: Text(
                          "Leather Sector Skill Council",
                          style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
                        )),
                         SizedBox(
                          height: 8,
                        ),
                        Center(
                            child: Text(
                          "Employee Registration Form",
                          style: TextStyle(),
                        )),
                        SizedBox(
                          height: 5,
                        ),
                        RegisterWidget(),
                        SizedBox(height: 21,),
        BusyButton(title: 'Submit', onPressed: null,color: Colors.blue,),
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
