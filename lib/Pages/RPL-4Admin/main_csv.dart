import 'package:csv_reader/csv_reader.dart';
import 'package:flutter/material.dart';

class MainCsvPage extends StatefulWidget {
  @override
  _MainCsvPageState createState() => _MainCsvPageState();
}

class _MainCsvPageState extends State<MainCsvPage> {
  @override
  void initState() {
    super.initState();
    fetchRows();
  }

  Future<List<DataRow>> fetchRows() async {
    String data = ModalRoute.of(context).settings.arguments;
    var myCSV = CSV.from(url: data, delimiter: ",", title: false);

    await myCSV.initFinished;

    print(myCSV.shape); //prints 28x71

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
