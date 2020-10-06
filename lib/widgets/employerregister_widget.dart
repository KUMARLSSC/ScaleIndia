import 'package:Scaleindia/ViewModels/employerRegister_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'input_field.dart';

class EmployerRegisterWidget extends StatefulWidget {
  @override
  _EmployerRegisterWidgetState createState() => _EmployerRegisterWidgetState();
}

class _EmployerRegisterWidgetState extends State<EmployerRegisterWidget> {
  final companyEmailController = TextEditingController();
  final companyNameController = TextEditingController();
  final companyemailController = TextEditingController();
  final companyAddressController = TextEditingController();
  final cityController = TextEditingController();
  final companyPhoneNumberController = TextEditingController();
  final pointOfContactNumberController = TextEditingController();
  final pointOfContactNameController = TextEditingController();
  final pocEmailAdressController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployerViewModel>.reactive(
        viewModelBuilder: () => EmployerViewModel(),
        builder: (context, model, child) => Column(
              children: [
                Container(
                  width: 500,
                  height: MediaQuery.of(context).size.height - 275,
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter Company Email Address:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Company EmailAddress',
                                controller: companyEmailController,
                                text1InputType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter company name:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Company name',
                                controller: companyNameController,
                                text1InputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter company address:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Company address',
                                controller: companyAddressController,
                                text1InputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter City:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'City',
                                controller: cityController,
                                text1InputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter State:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'State',
                                controller: stateController,
                                text1InputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter Pincode:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Pincode',
                                controller: pincodeController,
                                text1InputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter company phone number:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Company Phone number',
                                controller: companyPhoneNumberController,
                                text1InputType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter Point of contact name:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Point of contact name',
                                controller: pointOfContactNameController,
                                text1InputType: TextInputType.text,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter Point of phone number:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Point of contact phone number',
                                controller: pointOfContactNumberController,
                                text1InputType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 114,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Enter Poc email address:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: 'Poc email address',
                                controller: pocEmailAdressController,
                                text1InputType: TextInputType.emailAddress,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Create a password to login:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                password: true,
                                placeholder: 'Create a password',
                                controller: passwordController,
                                additionalNote:
                                    'Password has to be a minimum of 6 characters',
                                text1InputType: TextInputType.emailAddress,
                              ),
                            ),
                            SizedBox(
                              height: 150,
                            ),
                            new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: 10,
                ),
                BusyButton(
                  title: 'Submit',
                  busy: model.busy,
                  onPressed: () {
                    model.signUp(
                        companyEmailAddress: companyEmailController.text,
                        companyAddress: companyAddressController.text,
                        password: passwordController.text,
                        companyName: companyNameController.text,
                        city: cityController.text,
                        companyPhoneNumber: companyPhoneNumberController.text,
                        pointOfContactNumber:
                            pointOfContactNumberController.text,
                        pointOfContactName: pointOfContactNameController.text,
                        pocEmailAdress: pocEmailAdressController.text,
                        pincode: pincodeController.text,
                        state: stateController.text);
                  },
                  color: Colors.blue,
                ),
              ],
            ));
  }
}
