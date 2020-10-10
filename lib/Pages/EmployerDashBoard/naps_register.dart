import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/expansion_list.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:flutter/material.dart';

class NapsRegisterWidget extends StatefulWidget {
  @override
  _NapsRegisterWidgetState createState() => _NapsRegisterWidgetState();
}

class _NapsRegisterWidgetState extends State<NapsRegisterWidget> {
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
    return Column(
      children: [
        Container(
          width: 500,
          height: MediaQuery.of(context).size.height - 287,
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
                      "Name of the Establishment*",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter Establishment Name',
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
                      "Registration Type *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: ExpansionList<String>(
                          items: [
                            'Proprietorship/Individual',
                            'Company',
                            'Partnership',
                            'Trusts',
                            'Society'
                          ],
                          title: 'Select Registeration Type',
                          onItemSelected: null),
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
                      "PAN Number *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter Number',
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
                      "Address Line 1 *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter Address Line 1',
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
                      "Address Line 2 *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter Address Line 2',
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
                      "City *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
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
                      "State *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'State',
                        controller: stateController,
                        text1InputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
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
                      "District *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter district',
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
                              bottom: BorderSide(color: Colors.grey[200]))),
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
                      "Name of the Contact Person*",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter contact person name',
                        controller: pointOfContactNameController,
                        text1InputType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
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
                      "Mobile Number",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter Number',
                        controller: companyPhoneNumberController,
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
                      "Official Email ID *",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        placeholder: 'Enter email',
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
                      "Password:",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        password: true,
                        placeholder: ' password',
                        controller: passwordController,
                        additionalNote:
                            'Password has to be a minimum of 6 characters',
                        text1InputType: TextInputType.emailAddress,
                      ),
                    ),
                    Text(
                      "Confirm Password:",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey[200]))),
                      child: InputField(
                        password: true,
                        placeholder: 'Confirm password',
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
          height: 6,
        ),
        BusyButton(
          title: 'Submit',
          color: Colors.blue,
          onPressed: null,
        ),
      ],
    );
  }
}
