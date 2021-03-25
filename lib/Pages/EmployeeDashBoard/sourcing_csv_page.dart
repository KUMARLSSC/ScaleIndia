import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SourcingCsvHomePage extends StatefulWidget {
  @override
  _SourcingCsvHomePageState createState() => _SourcingCsvHomePageState();
}

class _SourcingCsvHomePageState extends State<SourcingCsvHomePage> {
  List<List<dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('SourcingFile').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Souring CSV Files"),
        backgroundColor: kBlack,
        centerTitle: true,
      ),
      // ignore: missing_required_param
      body: RefreshIndicator(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('SourcingFile')
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
                                        child: Text(
                                          documentSnapshot['location1'],
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
    );
  }

  Future<void> _getData() async {
    setState(() {
      FirebaseFirestore.instance.collection('SourcingFile').snapshots();
    });
  }
}

class Excel1 {
  final String location1;
  final String url1;
  final DocumentReference reference1;

  Excel1.fromMap(Map<String, dynamic> map, {this.reference1})
      : assert(map['location1'] != null),
        assert(map['url1'] != null),
        location1 = map['location1'],
        url1 = map['url1'];

  Excel1.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference1: snapshot.reference);

  @override
  String toString() => "Excel1<$location1:$url1>";
}
