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
            top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: nList
              .map((data) => RadioListTile(
                    title: Text("${data.number}",style: TextStyle(fontSize: 20),),
                    activeColor: Colors.green,
                    value: data.index,
                    groupValue: id,
                    onChanged: (val) {
                      setState(() {
                        id = data.index;
                      });
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }
}
