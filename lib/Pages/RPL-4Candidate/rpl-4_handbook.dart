import 'dart:io';
import 'package:Scaleindia/Pages/RPL-4Candidate/rpl4_home_widget.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/internet_connection.dart';
import 'package:flutter/material.dart';
import 'lss2301_page.dart';
import 'lss2401.dart';
import 'lss2501.dart';
import 'lss2601.dart';
import 'lss2701.dart';
import 'lss5301.dart';
import 'lss5501.dart';
import 'lss7501.dart';

class RPL4HandBook extends StatefulWidget {
  @override
  _RPL4HandBookState createState() => _RPL4HandBookState();
}

class _RPL4HandBookState extends State<RPL4HandBook> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("RPL-4 Candidate"),
          backgroundColor: kBlack,
          centerTitle: true,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  "Welcome To RPL-4",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                  child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ConnectionCheck(
                  child: Padding(
                      padding: EdgeInsets.all(1),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Text(
                              "Select a HandBook",
                              style: kTitleStyle,
                            )),
                            SizedBox(
                              height: 15,
                            ),
                            Rpl4HomeWidget(
                              title: 'Cutter (Footwear)',
                              btitle: 'LSSQ2301',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss2301Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Skiving Operator Footwear',
                              btitle: 'LSSQ2401',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss2401Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Stitching Operator ',
                              btitle: 'LSSQ2501',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss2501Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Pre Assembly Operations Footwear',
                              btitle: 'LSSQ2601',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss2601Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Lasting Operator',
                              btitle: 'LSSQ2701',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss2701Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Cutter (Goods & Garments)',
                              btitle: 'LSSQ5301',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss5301Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Stitching Goods and Garments',
                              btitle: 'LSSQ5501',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss5501Page()),
                                );
                              },
                            ),
                            Rpl4HomeWidget(
                              title: 'Moulding Operator ',
                              btitle: 'LSSQ7501',
                              onpressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Lss7501Page()),
                                );
                              },
                            ),
                          ],
                        ),
                      )),
                ),
              )),
            ],
          ),
        ));
  }

  Future<bool> _onWillPop() async {
    return exit(0);
  }
}
