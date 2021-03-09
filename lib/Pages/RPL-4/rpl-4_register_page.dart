import 'package:Scaleindia/Pages/RPL-4/rpl-4_register_widget.dart';
import 'package:flutter/material.dart';

class RPL4RegisterPage extends StatelessWidget {
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
                    "RPL-4 Registration Form",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 5,
                  ),
                  RPL4RegisterWidget(),
                  new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                ]),
          )),
    );
  }
}
