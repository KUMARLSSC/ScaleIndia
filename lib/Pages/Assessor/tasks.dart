import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'assessor_viewmodel.dart';
import 'bottom_sheet.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
        viewModelBuilder: () => AssessorPageViewModel(),
        builder: (context, model, child) => Container(
              width: 280.0,
              margin: const EdgeInsets.all(15.0),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Center(
                    child: Text(
                      "TASK 1",
                      style: kTitleStyle.copyWith(
                          color: Colors.yellowAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '1:',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            BottomSheetWidget()
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "2:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            BottomSheetWidget()
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "3:",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                              ),
                            ),
                            BottomSheetWidget()
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '4:',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                            BottomSheetWidget()
                          ],
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 5.0,
                      color: Colors.grey[300],
                      child: Text(
                        'Task 2',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        model.task1();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  )
                ],
              ),
            ));
  }
}

class Task1 {
  final String one;
  final String url1;
  final String two;
  final String url2;
  final String three;
  final String url3;
  final String four;
  final String url4;
  final DocumentReference reference;

  Task1.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['one'] != null),
        assert(map['url1'] != null),
        one = map['one'],
        url1 = map['url1'],
        two = map['two'],
        url2 = map['url2'],
        three = map['three'],
        url3 = map['url3'],
        four = map['four'],
        url4 = map['url4'];

  Task1.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Task1<$one:$url1>";
}
