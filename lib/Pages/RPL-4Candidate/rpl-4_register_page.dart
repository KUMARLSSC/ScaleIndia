import 'package:Scaleindia/Pages/RPL-4Candidate/rpl-4_register_widget.dart';
import 'package:Scaleindia/Pages/RPL-4Candidate/rpl-4_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RPL4RegisterPage extends StatelessWidget {
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RPL4ViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
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
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          )),
                          SizedBox(
                            height: 5,
                          ),
                          RPL4RegisterWidget(
                            onpressed: () {
                              model.login(
                                  phoneNumber1: phoneNumberController.text);
                            },
                          ),
                          new Padding(padding: EdgeInsets.only(bottom: 10.0)),
                        ]),
                  )),
            ),
        viewModelBuilder: () => RPL4ViewModel());
  }
}
