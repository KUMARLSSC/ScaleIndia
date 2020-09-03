import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
class FifthPage extends StatelessWidget {
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
                  width: MediaQuery.of(context).size.width ,
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
                            Center(child: Text('Start Your Practical and Theory Exam',textAlign: TextAlign.center,style: TextStyle(
                                color: Colors.limeAccent,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),),),
                              Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                            Center(
                              child: Text.rich(
                              TextSpan(children: [
                                TextSpan(text: "Enrollment ID:",style: TextStyle(color: Colors.white,fontSize: 17)),
                                TextSpan(text: "1234567890",style: TextStyle(color: Colors.white,fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold)),
                              ])
                                ),
                            ),
                            Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                            SizedBox(height: 5,),
                              Container(
                                height:MediaQuery.of(context).size.height - 227.0,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(
                                    children: [
                                      Center(child: Text("Instruction",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
                                    ],
                                  ),
                                ),
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