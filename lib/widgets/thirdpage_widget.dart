import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdPageWidget extends StatelessWidget {
  final CenterAssesor centerAssesor;
  ThirdPageWidget({this.centerAssesor});
  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Center :',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 108,
              child: Text(
                centerAssesor.centerName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              child: Text(
                "Assessor Name :",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 110,
              child: Text(
                centerAssesor.asContactPerson,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              child: Text(
                "Request ID :",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 110,
              child: Text(
                centerAssesor.asId.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 70,
              child: Text(
                "Batch ID :",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 110,
              child: Text(
                centerAssesor.asSdmsbatchName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.0,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
