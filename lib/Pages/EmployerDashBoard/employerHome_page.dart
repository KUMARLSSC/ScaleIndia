import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmployerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Blog').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              Center(
                child: ColorLoader3(),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot myblog = snapshot.data.documents[index];
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width - 10,
                          height: 350,
                          child: SingleChildScrollView(
                            child: Padding(
                            padding: EdgeInsets.only(top: 5.0, bottom: 5.0,left: 10),
                            child: Material(
                              color: Colors.white,
                              elevation: 14.0,
                              shadowColor: Color(0x802196f3),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 200.0,
                                        child: Image.network(
                                          '${myblog['image']}',
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        '${myblog['title']}',
                                        style: kTitleStyle,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${myblog['subtitle']}',
                                        style: kSubtitleStyle,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          )
                        )
                      ],
                    );
                  });
            }
            return ColorLoader3();
          }),
    );
  }
}