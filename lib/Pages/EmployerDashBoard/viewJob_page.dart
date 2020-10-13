import 'package:Scaleindia/Pages/EmployerDashBoard/naps_register.dart';
import 'package:flutter/material.dart';

class ViewJobPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/img/logo.png",
                        fit: BoxFit.fill,
                        height: 80,
                        width: 200,
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
                          "Naps Registration",
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        )),
                       SizedBox(height: 5,),
                        NapsRegisterWidget(),
                      
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
