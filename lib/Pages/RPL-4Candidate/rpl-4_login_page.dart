import 'package:Scaleindia/Pages/RPL-4Candidate/rpl-4_home_page.dart';
import 'package:Scaleindia/Pages/RPL-4Candidate/rpl-4_viewmodel.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class RPL4LoginPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();
  final DialogService _dialogService = locator<DialogService>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RPL4ViewModel>.reactive(
      viewModelBuilder: () => RPL4ViewModel(),
      builder: (context, model, child) => Scaffold(
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
              height: 20,
            ),
            Center(
              child: Text(
                "Welcomes You",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: Text(
                        " RPL-4 Candidate",
                        style: kTitleStyle,
                      )),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
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
                                      bottom:
                                          BorderSide(color: Colors.grey[200]))),
                              child: InputField(
                                placeholder: '  Phone',
                                controller: phoneNumberController,
                                text1InputType: TextInputType.phone,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      BusyButton(
                          title: 'Login',
                          color: Colors.green,
                          onPressed: () {
                            getData(phoneNumberController.text, context);
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      BusyButton(
                        title: 'Register',
                        color: Colors.blue[300],
                        onPressed: () {
                          model.navigateToRPL4LRegisterPage();
                        },
                      ),
                      new Padding(padding: EdgeInsets.only(bottom: 20.0)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('RPL-4Admin');

  Future<void> getData(Object value, BuildContext context) async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    if (allData.any((element) => element.toString().contains(value)) &&
        phoneNumberController.text.length == 10 &&
        phoneNumberController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RPL4HomePage()),
      );
    } else {
      await _dialogService.showDialog(
        title: 'Failed',
        description:
            'Please enter valid phone number or Please enter 10 Digit phone number',
      );
    }
  }
}
