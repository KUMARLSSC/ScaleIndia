import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsState createState() => _OptionsState();
}

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});
}

class _OptionsState extends State<Options> {
  int id = 1;
  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "Job card",
    ),
    NumberList(
      index: 2,
      number: "Identity card",
    ),
    NumberList(
      index: 3,
      number: "Log book",
    ),
    NumberList(
      index: 4,
      number: "Accident report",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 1.0, bottom: 2.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new  RadioListTile<int>(
                    title: Text("hi",style: TextStyle(fontSize: 20),),
                    activeColor: Colors.green,
                    value: 0,
                    groupValue: id,
                    onChanged:null
                  ),
                   new  RadioListTile<int>(
                    title: Text("hi",style: TextStyle(fontSize: 20),),
                    activeColor: Colors.green,
                    value: 1,
                    groupValue: id,
                    onChanged:null
                  ),
                   new  RadioListTile<int>(
                    title: Text("hi",style: TextStyle(fontSize: 20),),
                    activeColor: Colors.green,
                    value: 2,
                    groupValue: id,
                    onChanged:null
                  ),
                   new  RadioListTile<int>(
                    title: Text("hi",style: TextStyle(fontSize: 20),),
                    activeColor: Colors.green,
                    value: 3,
                    groupValue: id,
                    onChanged:null
                  )
          ]
        ),
      ),
    );
  }
}
