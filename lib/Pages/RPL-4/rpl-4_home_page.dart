import 'dart:io';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RPL4HomePage extends StatefulWidget {
  @override
  _RPL4HomePageState createState() => _RPL4HomePageState();
}

class _RPL4HomePageState extends State<RPL4HomePage> {
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
        title: "Drum Operator",
        path:
            "http://leatherssc.org/pdf/LeatherPhase1/Revised%20Leather%20QP_Finished%20Leather_Post%20NSQC/Drum%20Operator_Finished%20Leather_revised.pdf"));
    courseContent.add(Course(
        title: "Buffing Operator",
        path:
            "http://leatherssc.org/pdf/LeatherPhase1/Revised%20Leather%20QP_Finished%20Leather_Post%20NSQC/Buffing%20Operator_Finished%20Leather_revised.pdf"));
    courseContent.add(Course(
        title: "Cutter",
        path:
            "http://leatherssc.org/pdf/LeatherPhase1/Revised%20Leather%20QP_%20G%20n%20G_Final/Cutter_Goods%20Garments_Revised.pdf"));
    courseContent.add(Course(
        title: "Stitcher",
        path:
            "http://leatherssc.org/pdf/LeatherPhase1/Revised%20Leather%20QP_%20G%20n%20G_Final/Stitcher_Gn%20G_Revised.pdf"));
    courseContent.add(Course(
        title: "Operator – Moulding",
        path:
            "http://leatherssc.org/pdf/LeatherPhase1/Revised%20Leather%20QP_Footwear_Final/Moulding%20Operator(%20Non%20Leather%20Footwear)_Revised.pdf"));
    courseContent.add(Course(
        title: "Knitting Operator Footwear",
        path:
            "http://leatherssc.org/wp-content/uploads/2020/05/QP-TempID-206-updated.pdf"));
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
        title: Text("RPL-4"),
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
                            fontSize: 15,
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
