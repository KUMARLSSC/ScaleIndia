import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

import 'lss2301_page.dart';

class Lss2701Page extends StatefulWidget {
  @override
  _Lss2701PageState createState() => _Lss2701PageState();
}

class _Lss2701PageState extends State<Lss2701Page> {
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
        title: "Lasting Operator English",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2701%2FLasting%20Operator%20-%20LSSQ2701%20_%20English.pdf?alt=media&token=e59a617f-8265-497d-92f7-53dc22ae9152"));
    courseContent.add(Course(
        title: "Lasting Operator Tamil",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2701%2FLasting%20Operator%20-%20LSSQ2701%20_%20Tamil.pdf?alt=media&token=198b98f0-9e09-4271-aa2c-bacac661e713"));
    courseContent.add(Course(
        title: "Lasting Operator Hindi",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2701%2FLasting%20Operator%20-%20LSSQ2701%20_%20Hindi.pdf?alt=media&token=1f37af6b-bcc0-4689-b13a-88446a70fab6"));
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
        title: Text("LSSQ2701"),
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
