import 'package:Scaleindia/ViewModels/practicalpage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';

class PracticalPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
          child: header(context,
              isAppTitle: false, isIcon: false, strTitle: "Practical Exam"),
          preferredSize: Size.fromHeight(50.0)),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 30.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.blue[900],
                  Colors.blue[800],
                  Colors.blue[400]
                ]),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      color: Colors.lightBlue,
                      child: Center(
                        child: Text(
                          "LSS/N5501",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 330,
                      height: 480,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child: PracticalViewModel(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      width: 140,
                      child: RaisedButton(
                        splashColor: Colors.blue,
                        elevation: 5.0,
                        color: new Color(0xFFEA4335),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
