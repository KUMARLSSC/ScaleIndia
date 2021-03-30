import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Lss2301Page extends StatefulWidget {
  @override
  _Lss2301PageState createState() => _Lss2301PageState();
}

class _Lss2301PageState extends State<Lss2301Page> {
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
        title: "Cutter (Footwear) English",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2301%2FCutter%20(Footwear)LSSQ2301%20English.pdf?alt=media&token=577f2f6d-88f2-413b-a2a1-a668396fe8a3"));
    courseContent.add(Course(
        title: "Cutter (Footwear) Tamil",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2301%2FCutter%20(Footwear)LSSQ2301%20Tamil%20Version.pdf?alt=media&token=a9eb3045-7f7a-4d4f-9fb4-cef530f6b0ab"));
    courseContent.add(Course(
        title: "Cutter (Footwear) Hindi",
        path:
            "https://firebasestorage.googleapis.com/v0/b/scaleindia.appspot.com/o/Rpl4-pdf%2F2301%2FCutter%20(Footwear)LSSQ2301%20Hindi..pdf?alt=media&token=e285bbe2-b995-4b89-915e-0569fe13edc4"));
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
        title: Text("LSSQ2301"),
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
class PDFScreen extends StatelessWidget {
  String pathPDF = "";
  PDFScreen(this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
        appBar: AppBar(
          backgroundColor: kBlack,
          centerTitle: true,
          title: Text("Document"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        path: pathPDF);
  }
}

class Course {
  String title;
  String path;
  Course({this.title, this.path});
}
