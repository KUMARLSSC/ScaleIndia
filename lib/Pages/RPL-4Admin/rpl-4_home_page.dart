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
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Stack(
                                  children: <Widget>[
                                    Container(
                                      height: 100,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image:
                                              AssetImage('assets/img/logo.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Container(
                                        height: 140,
                                        child: Card(
                                          margin: EdgeInsets.all(18),
                                          elevation: 7.0,
                                          child: Center(
                                            child: Text(
                                              documentSnapshot['location'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
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

class Excel {
  final String location;
  final String url;
  final DocumentReference reference;

  Excel.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['location'] != null),
        assert(map['url'] != null),
        location = map['location'],
        url = map['url'];

  Excel.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Excel<$location:$url>";
}
