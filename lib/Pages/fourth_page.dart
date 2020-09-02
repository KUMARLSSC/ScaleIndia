import 'package:Scaleindia/ViewModels/participant_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
              child: header(context, isAppTitle: true, isIcon: false),
              preferredSize: Size.fromHeight(50.0)),
              body: Center(
                child:Container(
              height: MediaQuery.of(context).size.height - 30.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 5.0,
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
                            Center(child: Text('Participant List', style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),),
                              Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [ 
                                   Text(
                                  'ID',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                Text(
                                  'Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                 Text(
                                  'Exam',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                                ],
                              ),
                              Container(
                                child: ParticipantViewModel(),
                              )
                             
                               ]
                          )),
                    ],
                  ),
                ),
              ),
            ), 
                ),
    );
  }
}