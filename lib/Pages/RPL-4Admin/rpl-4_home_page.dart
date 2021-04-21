import 'dart:io';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/RPL-4Admin/rpl4_csv_Page.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class RPL4HomePageAdmin extends StatefulWidget {
  @override
  _RPL4HomePageAdminState createState() => _RPL4HomePageAdminState();
}

class _RPL4HomePageAdminState extends State<RPL4HomePageAdmin> {
  final NavigationService _navigationService = locator<NavigationService>();
  List<List<dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('RPL-4Admin').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BusyButton(
            onPressed: () {
              openfile(context);
            },
            title: 'Bulk Upload',
            color: Colors.green,
          ),
          appBar: AppBar(
            title: Text("RPL-4 Admin"),
            backgroundColor: kBlack,
            centerTitle: true,
          ),
          // ignore: missing_required_param
          body: RefreshIndicator(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('RPL-4Admin')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: ColorLoader3(
                      radius: 20.0,
                      dotRadius: 10.0,
                    ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot documentSnapshot =
                              snapshot.data.docs[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Material(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(15),
                              elevation: 8,
                              child: Container(
                                width: width,
                                height: height,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            documentSnapshot['name'],
                                            style: TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 19,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1,
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  'Aadhar no:${documentSnapshot['aadharNo']}'),
                                              Text(
                                                  'DOB:${documentSnapshot['dob']}')
                                            ],
                                          ),
                                          Divider(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'JobRole : ${documentSnapshot['jobRole']}',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    height: 1.5,
                                                  ),
                                                  Text(
                                                    'Employement Status:   ${documentSnapshot['employementName']}',
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
              ),
              onRefresh: _getData),
        ),
        onWillPop: () => _onWillPop());
  }

  Future<void> _getData() async {
    setState(() {
      FirebaseFirestore.instance..collection('RPL-4Admin').snapshots();
    });
  }

  Future<bool> _onWillPop() async {
    return _navigationService.navigateTo(Rpl4CategoryViewRoute);
  }

  Future<void> openfile(BuildContext context) async {
    File file = await FilePicker.getFile(
      type: FileType.custom,
    );
    String path = file.path;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) {
          return LoadCsvDataScreen(path: path);
        },
      ),
    );
  }
}
