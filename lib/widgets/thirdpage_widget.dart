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
        DataTable(columnSpacing: 10, columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Center :',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.black,
                fontSize: 17.0,
              ),
            ),
          ),
          DataColumn(
            label: Text(
              centerAssesor.centerName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 17.0,
              ),
              maxLines: 1,
            ),
          ),
        ], rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                "Assesser Name :",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              )),
              DataCell(
                Text(
                  centerAssesor.asContactPerson,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
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
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              )),
              DataCell(
                Text(
                  centerAssesor.asId.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
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
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17.0,
                ),
              )),
              DataCell(
                Text(
                  centerAssesor.asSdmsbatchName,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
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
