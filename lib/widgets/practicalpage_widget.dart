import 'package:flutter/material.dart';

class PracticalPageWidget extends StatefulWidget {
  @override
  _PracticalPageWidgetState createState() => _PracticalPageWidgetState();
}

class _PracticalPageWidgetState extends State<PracticalPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Container(
                       height: 60,
            color: Colors.grey[350],
            child: Center(child: Text("1:"+"Select the right sewing machine .threads and bobbins for the materials as per the specifications in the job card ", style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),),
                    ),
       ],
    );
  }
}
