import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'lss2301_page.dart';

class Lss7501Page extends StatefulWidget {
  @override
  _Lss7501PageState createState() => _Lss7501PageState();
}

class _Lss7501PageState extends State<Lss7501Page> {
  bool isLoading;
  // ignore: deprecated_member_use
  List<Course> courseContent = new List();

  String progress = "";
  Dio dio;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    courseContent.add(Course(
        title: "Moulding Operator English",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F7501%2FMoulding%20Operator%20LSSQ7501%20English.pdf?alt=media&token=253a27a9-4827-442f-9e87-3d146fd48e1f"));
    courseContent.add(Course(
        title: "Moulding Operator Tamil",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F7501%2FMoulding%20Operator%20LSSQ7501%20Tamil.pdf?alt=media&token=59d03c44-ce40-4e53-b150-992bb908bd5f"));
    courseContent.add(Course(
        title: "Moulding Operator Hindi",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F7501%2FMoulding%20Operator%20LSSQ7501%20Hindi.pdf?alt=media&token=75b594c4-3e61-4e3c-b145-53e44dbc8ea8"));
    courseContent.add(Course(
        title: "Moulding Operator Kanada",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F7501%2FMoulding%20Operator%20LSSQ7501%20Marati.pdf?alt=media&token=bf0f945f-3c85-4cb0-b728-8803318ce3e1"));
    courseContent.add(Course(
        title: "Moulding Operator(Foot Wear)English",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F7501%2FMoulding%20Operator%20(%20Foot%20Wear%20)%20LSSQ7501%20Hand%20Book%20-%20English.pdf?alt=media&token=20c7c311-42e7-48c8-9163-fe34a0131373"));
  }

  Future<String> getDirectoryPath() async {
    Directory appDocDirectory = await getApplicationDocumentsDirectory();

    Directory directory =
        await new Directory(appDocDirectory.path + '/' + 'dir')
            .create(recursive: true);

    return directory.path;
  }

  Future downloadFile(String url, path) async {
    try {
      ProgressDialog progressDialog =
          ProgressDialog(context, type: ProgressDialogType.Normal);
      progressDialog.style(message: "Downloading File");
      progressDialog.show();

      await dio.download(url, path, onReceiveProgress: (rec, total) {
        setState(() {
          isLoading = true;
          progress = ((rec / total) * 100).toStringAsFixed(0) + "%";
          progressDialog.update(message: "Dowloading $progress");
        });
      });
      progressDialog.hide();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text("LSSQ7501"),
        backgroundColor: kBlack,
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) {
            String url = courseContent[index].path;
            String title = courseContent[index].title;
            String extension = url.substring(url.lastIndexOf("/"));
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
                        "$title",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.purpleAccent,
                            fontWeight: FontWeight.bold),
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          getDirectoryPath().then((path) {
                            File f = File(path + "$extension");
                            if (f.existsSync()) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PDFScreen(f.path);
                              }));
                              return;
                            }

                            downloadFile(url, "$path/$extension");
                          });
                        },
                        child: Text(
                          "View",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          itemCount: courseContent.length,
        ),
      ),
    );
  }
}
