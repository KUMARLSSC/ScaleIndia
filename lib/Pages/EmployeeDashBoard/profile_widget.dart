import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'employeePage_viewmodel.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
 final User user =  _auth.currentUser;
class ProfileWidget extends StatefulWidget {
  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmployeePageViewModel>.reactive(
      viewModelBuilder: () => EmployeePageViewModel(),
      builder: (context, model, child) => StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Employees')
            .doc(user.uid)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(color: kBlack),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            "Profile",
                            style: TextStyle(color: Colors.white, fontSize: 23),
                          ),
                        ),
                        Center(
                          child: CircleAvatar(
                            backgroundColor: kBlackAccent,
                            radius: 50,
                            backgroundImage: AssetImage('assets/img/boy1.png'),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "${snapshot.data['name']}",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
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
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: <Widget>[
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "Email:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                     "${snapshot.data['employeeEmailAddress']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "Ph-Number:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data['phoneNumber']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "Address:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                   "${snapshot.data['address']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "City:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data['city']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "State:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data['state']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "PinCode:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data['pincode']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 25,
                              ),
                              Center(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 28,
                                  ),
                                  Text(
                                    "WorkExperiance:",
                                    style: kTitleStyle,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "${snapshot.data['workExperiance']}",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )
                                ],
                              )),
                              SizedBox(
                                height: 18,
                              ),
                              BusyButton(
                                title: 'Logout',
                                busy: model.busy,
                                onPressed: () {
                                  model.logOut();
                                },
                                color: kBlackAccent,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return LinearProgressIndicator();
        },
      ),
    );
  }
}
