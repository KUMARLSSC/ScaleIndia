import 'dart:io';
import 'dart:math';

import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class RPL4HomePageAdmin extends StatefulWidget {
  @override
  _RPL4HomePageAdminState createState() => _RPL4HomePageAdminState();
}

class _RPL4HomePageAdminState extends State<RPL4HomePageAdmin> {
  bool _isloading2 = false;
  double _progress2 = 0;
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance..collection('RPL-4Admin').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("RPL-4 Admin"),
        backgroundColor: kBlack,
        centerTitle: true,
      ),
      // ignore: missing_required_param
      body: RefreshIndicator(
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('RPL-4Admin').snapshots(),
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
                                      image: AssetImage('assets/img/logo.png'),
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
                                        child:
                                            Text(documentSnapshot['location']),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openfile(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _getData() async {
    setState(() {
      FirebaseFirestore.instance..collection('RPL-4Admin').snapshots();
    });
  }

  Future<void> openfile(BuildContext context) async {
    File file = await FilePicker.getFile(type: FileType.custom);
    uploadFile(file);
  }

  Future<void> uploadFile(File image2) async {
    try {
      int randomNumber2 = Random().nextInt(10000000);
      String imageLocation2 = 'RPL-4/csv$randomNumber2.csv';
      final Reference reference2 =
          FirebaseStorage.instanceFor(bucket: "gs://scaleindia.appspot.com")
              .ref()
              .child(imageLocation2);
      final UploadTask uploadTask = reference2.putFile(image2);
      uploadTask.snapshotEvents.listen((event) {
        setState(() {
          _isloading2 = true;
          _progress2 = event.bytesTransferred / event.totalBytes.toDouble();
          print(_progress2);
        });
      });
      TaskSnapshot taskSnapshot = await uploadTask;
      _addFileToDatabase2(
        imageLocation2,
      );
      String url = await taskSnapshot.ref.getDownloadURL();
      print('url$url');
    } catch (e) {
      print(e);
    }
  }

  Future<void> _addFileToDatabase2(
    String text2,
  ) async {
    try {
      // Get image URL from firebase
      final ref = FirebaseStorage.instance.ref().child(text2);
      var imageString = await ref.getDownloadURL();

      // Add location and url to database
      await FirebaseFirestore.instance.collection('RPL-4Admin').doc().set({
        'url': imageString,
        'location': text2,
      });
    } catch (e) {
      print(e.message);
    }
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
