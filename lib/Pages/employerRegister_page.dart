import 'package:Scaleindia/widgets/employerregister_widget.dart';

import 'package:flutter/material.dart';

class EmployerRegisterPage extends StatelessWidget {
  
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: Image.asset(
                        "assets/img/lssc.jpg",
                        fit: BoxFit.fill,
                        height: 92,
                        width: 150,
                      ),
                    ),
                  )
                ],
              ),
            ),
           Container(
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
                          style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),
                        )),
                         SizedBox(
                          height: 3,
                        ),
                        Center(
                            child: Text(
                          "Employer/Company Registration Form",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        )),
                       SizedBox(height: 5,),
                        EmployerRegisterWidget(),
                      
                        new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                      ],
                    ),

                
              ),
            )
          ],
        ),
      ),
    );
  }
}
