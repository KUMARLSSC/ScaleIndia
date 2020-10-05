import 'package:Scaleindia/ViewModels/employeeRegister_viewmodel.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'busy_button.dart';
import 'expansion_list.dart';
import 'input_field.dart';

class EmployeeRegisterWidget extends StatefulWidget {
  @override
  _EmployeeRegisterWidgetState createState() => _EmployeeRegisterWidgetState();
}

class _EmployeeRegisterWidgetState extends State<EmployeeRegisterWidget> {
  String _selectedDate = 'Date of birth';
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final motherNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final aadharNumberController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final alternatePhoneNumberController = TextEditingController();
  final educationQualificationController = TextEditingController();
  final workExperianceController = TextEditingController();
  final districtController = TextEditingController();
  final stateController = TextEditingController();
  final pincodeController = TextEditingController();
  final lastCompanyWorkedForController = TextEditingController();
  final lastWorkingDesignationController = TextEditingController();
  final addressController = TextEditingController();
  final genderController =TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime d = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime.now(),
    );
    if (d != null)
      setState(() {
        _selectedDate = new DateFormat.yMMMMd("en_US").format(d);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeeViewModel>.reactive(
        viewModelBuilder: () => EmployeeViewModel(),
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
                            "Enter your Email Address:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'EmailAddress',
                                  controller: emailController,
                                  text1InputType: TextInputType.emailAddress,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                                Text(
                            "Enter your name:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Name',
                                  controller: nameController,
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                                Text(
                            "Gender:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: ExpansionList<String>(
                                    items: ['Male', 'Female', 'Other'],
                                    title: model.selectedRole,
                                    onItemSelected: model.setSelectedRole),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 69,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    InkWell(
                                      child: Text(_selectedDate,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xFF000000))),
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.calendar_today),
                                      tooltip: 'Tap to open date picker',
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
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
                            "Enter your Aadhar number:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Aadhar number',
                                  controller: aadharNumberController,
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
                            "Enter your phone number:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Phone number',
                                  controller: phoneNumberController,
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
                            "Enter your alternate phone number:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: ' Alternate Phone number',
                                  controller: alternatePhoneNumberController,
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
                            "Enter your father name:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Father name',
                                  controller: fatherNameController,
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
                            "Enter your mother name:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Mother name',
                                  controller: motherNameController,
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
                            "Enter your address:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Address',
                                  controller: addressController,
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
                            "Enter District:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'District',
                                  controller: districtController,
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
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
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
                            "Enter pincode:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Pin code',
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
                            "Enter your Educational Qualification:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Educational Qualification',
                                  controller: educationQualificationController,
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
                            "Enter your Work Experiance:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Work Experiance',
                                  controller: workExperianceController,
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
                            "Enter your Last Company Worked for:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Last Company Worked for',
                                  controller: lastCompanyWorkedForController,
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
                            "Enter your Last Working Designation:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Last Working Designation',
                                  controller: lastWorkingDesignationController,
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
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: <Widget>[
                               Text(
                            "Create a password to login:",
                            style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                          ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  password: true,
                                  placeholder: 'Create a password',
                                  controller: passwordController,
                                  additionalNote:
                                      'Password has to be a minimum of 6 characters',
                                  text1InputType: TextInputType.emailAddress,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 1,),
                BusyButton(
                  busy: model.busy,
                  title: 'Submit',
                  onPressed: () {
                    model.signUp(
                        emailAddress: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        motherName: motherNameController.text,
                        fatherName: fatherNameController.text,
                        phoneNumber: phoneNumberController.text,
                        alternatePhoneNumber: alternatePhoneNumberController.text,
                        district: districtController.text,
                        pincode: pincodeController.text,
                        state: stateController.text,
                        educationalQualification: educationQualificationController.text,
                        lastCompanyWorkedFor: lastCompanyWorkedForController.text,
                        lastWorkingDesignation: lastWorkingDesignationController.text,
                        dateOfBirth: dateOfBirthController.text,
                        gender: genderController.text,
                        aadharNumber: aadharNumberController.text,
                        workExperiance: workExperianceController.text);
                  },
                  color: Colors.blue,
                ),
              ],
            ));
  }
}
