import 'package:flutter/material.dart';

class Rpl4HomeWidget extends StatelessWidget {
  final String title;
  final String btitle;
  final Function onpressed;
  Rpl4HomeWidget({this.onpressed, this.title, this.btitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.purpleAccent,
                    fontWeight: FontWeight.bold),
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.green,
                onPressed: onpressed,
                child: Text(
                  btitle,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
