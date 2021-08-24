import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/RPL-5/rpl-5_viewmodel.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/locator.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:Scaleindia/widgets/text_link.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class RPL5LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RPL5ViewModel>.reactive(
      viewModelBuilder: () => RPL5ViewModel(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () => _onWillPop(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
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
                height: 30,
              ),
              Center(
                child: Text(
                  "RPL - 5 Assessment",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Container(
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
                                      placeholder: 'User ID',
                                      controller: emailController,
                                      text1InputType: TextInputType.text,
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
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: BusyButton(
                              title: 'Login',
                              color: Colors.green,
                              onPressed: () {
                                model.login(
                                    email: emailController.text,
                                    password: passwordController.text);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return _navigationService.navigateTo(CandidateViewRoute);
  }
}
