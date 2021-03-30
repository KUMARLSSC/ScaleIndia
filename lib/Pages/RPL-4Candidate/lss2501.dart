import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'lss2301_page.dart';

class Lss2501Page extends StatefulWidget {
  @override
  _Lss2501PageState createState() => _Lss2501PageState();
}

class _Lss2501PageState extends State<Lss2501Page> {
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
        title: "Stitching Operator English",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2501%2FStitching%20Operator%20LSSQ2501%20-%20English.pdf?alt=media&token=e1f08edd-2ed2-4614-bbac-039bb5f13b1d"));
    courseContent.add(Course(
        title: "Stitching Operator Tamil",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2501%2FStitching%20Operator%20LSSQ2501%20-%20Tamil.pdf?alt=media&token=28887229-0c36-4236-8c8b-34bf16b3d165"));
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
        title: Text("LSSQ2501"),
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
