import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'lss2301_page.dart';

class Lss5301Page extends StatefulWidget {
  @override
  _Lss5301PageState createState() => _Lss5301PageState();
}

class _Lss5301PageState extends State<Lss5301Page> {
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
        title: "Cutter (Goods & Garments) English",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F5301%2FCutter%20(Goods%20%26%20Garments)LSSQ5301%20English.pdf?alt=media&token=a4469d35-bc21-4a00-a031-000750dde047"));
    courseContent.add(Course(
        title: "Cutter (Goods & Garments) Tamil",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F5301%2FCutting%20Goods%20%26%20Garments%20%20LSSQ5301%20Tamil.pdf?alt=media&token=d78902e7-6770-4549-b40f-9dda4e9bcbff"));
    courseContent.add(Course(
        title: "Cutter (Goods & Garments) Hindi",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F5301%2FCutter%20Goods%20%26%20Garments%20%20LSSQ5301%20Hindi.pdf?alt=media&token=0690a9e2-ac64-4ee9-96dd-a52db9a73b01"));
    courseContent.add(Course(
        title: "Cutter (Goods & Garments) Kanada",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F5301%2FCutter%20Goods%20%26%20Garments%20%20LSSQ5301%20Kanada.pdf?alt=media&token=31ddc60c-2390-47be-9f28-d6a98fa06637"));
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
        title: Text("LSSQ5301"),
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

// ignore: must_be_immutable
