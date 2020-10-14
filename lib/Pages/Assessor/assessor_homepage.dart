import 'package:Scaleindia/Pages/Assessor/bottom_sheet.dart';
import 'package:Scaleindia/ViewModels/assessor_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AssessorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
        viewModelBuilder: () => AssessorPageViewModel(),
        builder: (context, model, child) => Scaffold(
            appBar: PreferredSize(
                child: header(context, isAppTitle: true, isIcon: false),
                preferredSize: Size.fromHeight(50.0)),
            body:  Container(
                    width: MediaQuery.of(context).size.width ,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                      children: [
                        const SizedBox(height: 20,),
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
                            "Center and Assessor info",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 27,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          color: Colors.black12,
                          height: 15,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(padding: const EdgeInsets.only(left: 50),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Center :',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    fontSize: 17.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                               Expanded(child:  Container(
                                  width:
                                      MediaQuery.of(context).size.width - 108,
                                  child: Text(
                                    'Chennai',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70,
                                  child: Text(
                                    "Assessor Name :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: Text(
                                    'Pranjal',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70,
                                  child: Text(
                                    "Assessor ID :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: Text(
                                    '54321',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70,
                                  child: Text(
                                    "Batch ID :",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: Text(
                                    '1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 70,
                                  child: Text(
                                    "Status:",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                               Expanded(child:  Container(
                                  width:
                                      MediaQuery.of(context).size.width - 110,
                                  child: Text(
                                    'Not Activated ',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 50,
                              width: 140,
                              child: RaisedButton(
                                splashColor: Colors.blue,
                                elevation: 5.0,
                                color: Colors.grey[300],
                                child: Text(
                                  'Start',
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  _asyncSimpleDialog(context);
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            )),
                      ],
                    ),
                    )
                  ),
                ),
              );
  }

  Future _asyncSimpleDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: const Text('Please activate by uploading photo '),
              children: [
                BottomSheetWidget(),
              ]);
        });
  }
}
