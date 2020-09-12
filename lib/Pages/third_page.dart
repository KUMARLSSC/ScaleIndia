import 'package:Scaleindia/ViewModels/thirdpage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ThirdPageViewModel>.reactive(
      viewModelBuilder: () => ThirdPageViewModel(),
      builder: (context, model, child) => Scaffold(
          appBar: PreferredSize(
              child: header(context, isAppTitle: true, isIcon: false),
              preferredSize: Size.fromHeight(50.0)),
          body: Padding(
            padding: EdgeInsets.only(left: 13),
            child: Container(
              height: MediaQuery.of(context).size.height - 170.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        colors: [
                          Colors.blue[900],
                          Colors.blue[800],
                          Colors.blue[400]
                        ]),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                  bottomRight: Radius.circular(15.0),
                                ),
                                child: Image.asset(
                                  "assets/img/scale.png",
                                  fit: BoxFit.fill,
                                  height: 155,
                                  width: 450,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Center and Assesser info",
                                style: TextStyle(
                                    color: Colors.white,
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
                            DataTable(columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Center :',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Chennai',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ], rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    "Assesser Name :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  )),
                                  DataCell(
                                    Text(
                                      "Snbham",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    "Request ID :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  )),
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    "Batch ID :",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  )),
                                  DataCell(
                                    Text(
                                      "SDMS9178",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
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
                              color: new Color(0xffffffff),
                              child: Text(
                                'Candidate List',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.blueAccent,
                                ),
                              ),
                              onPressed: () {
                                model.navigateToFourthPage();
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
