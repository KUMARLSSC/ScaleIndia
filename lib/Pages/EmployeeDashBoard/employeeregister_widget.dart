import 'package:Scaleindia/ViewModels/employeeRegister_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/expansion_list.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EmployeeRegisterWidget extends StatefulWidget {
  @override
  _EmployeeRegisterWidgetState createState() => _EmployeeRegisterWidgetState();
}

class _EmployeeRegisterWidgetState extends State<EmployeeRegisterWidget> {
  final List<String> gender = ['Male', 'Female', 'Other'];

  Map<String, String> stateCity = {
    "Surat": "Gujarat",
    "Ahmadabad": "Gujarat",
    "Vadodara": "Gujarat",
    "Mp1": "Mp",
    "Mp2": "Mp",
    "Up1": "Up",
    "Up2": "Up",
    "Up3": "Up",
  };

  List<String> state = ['Gujarat', 'Mp', 'Up'];
  List<String> city = [];

  String selectedState;
  String selectedcity;
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
  final genderController = TextEditingController();

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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: ExpansionList<String>(
                                    items: gender,
                                    title: model.selectedRole,
                                    onItemSelected: model.setSelectedRole),
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
                                "Enter your date of birth:",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: 'Date of Birth',
                                  controller: dateOfBirthController,
                                  text1InputType: TextInputType.number,
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: "Father's name",
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
                                "Enter your mother's name:",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey[200]))),
                                child: InputField(
                                  placeholder: "Mother's name",
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                        Column(
                          children: <Widget>[
                            Text(
                              "State:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              width: 200,
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[200],
                                  border: Border.all()),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  isExpanded: true,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedState = value;
                                      selectedcity = null;
                                      city.clear();
                                      stateCity.forEach((k, v) {
                                        print(k);
                                        if (selectedState == v) {
                                          city.add(k);
                                        }
                                      });
                                    });
                                  },
                                  value: selectedState,
                                  hint: Center(
                                    child: Text('Select a state'),
                                  ),
                                  items: state
                                      .map((state) => DropdownMenuItem(
                                            child: Text(state),
                                            value: state,
                                          ))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "City:",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.normal),
                            ),
                            Container(
                              width: 200,
                              padding: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[200],
                                  border: Border.all()),
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                isExpanded: true,
                                onChanged: (value) {
                                  setState(() {
                                    selectedcity = value;
                                  });
                                  print(value);
                                },
                                value: selectedcity,
                                hint: Center(
                                  child: Text('Select a city'),
                                ),
                                items: selectedState != null
                                    ? city
                                        .map((city) => DropdownMenuItem(
                                              child: Text(city),
                                              value: city,
                                            ))
                                        .toList()
                                    : [],
                              )),
                            ),
                          ],
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
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
                          height: 150,
                        ),
                        new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                BusyButton(
                  busy: model.busy,
                  title: 'Submit',
                  onPressed: () {
                    model.signUp(
                        address: addressController.text,
                        employeeEmailAddress: emailController.text,
                        password: passwordController.text,
                        name: nameController.text,
                        motherName: motherNameController.text,
                        fatherName: fatherNameController.text,
                        phoneNumber: phoneNumberController.text,
                        alternatePhoneNumber:
                            alternatePhoneNumberController.text,
                        district: selectedcity,
                        pincode: pincodeController.text,
                        state: selectedState,
                        educationalQualification:
                            educationQualificationController.text,
                        lastCompanyWorkedFor:
                            lastCompanyWorkedForController.text,
                        lastWorkingDesignation:
                            lastWorkingDesignationController.text,
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
