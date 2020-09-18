import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
              bottomLeft: Radius.circular(15.0),
              bottomRight: Radius.circular(15.0),
            ),
            child: Image.asset(
              "assets/img/scale.png",
              fit: BoxFit.fill,
              height: 155,
              width: 450,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Center and Assesser info",
            style: TextStyle(
                color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
          ),
        ),
        Divider(
          color: Colors.black12,
          height: 15,
        ),
        SizedBox(
          height: 10,
        ),
        DataTable(columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Center :',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              centerAssesor.centerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
        ], rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                "Assesser Name :",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )),
              DataCell(
                Text(
                  centerAssesor.asContactPerson,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                "Request ID :",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )),
              DataCell(
                Text(
                  centerAssesor.asId.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                "Batch ID :",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )),
              DataCell(
                Text(
                  centerAssesor.asSdmsbatchName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
