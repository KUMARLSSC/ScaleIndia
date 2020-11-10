import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ViewModels/practicalpage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/practicalpage_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PracticalPage extends StatefulWidget {
  final Practical practical;
  final Candidate candidate;
  PracticalPage({this.practical, this.candidate});
  @override
  _PracticalPageState createState() => _PracticalPageState();
}

class _PracticalPageState extends State<PracticalPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<PracticalPageViewModel>.reactive(
        onModelReady: (model) => model.getPractical(centerAssesor.asId),
        viewModelBuilder: () => PracticalPageViewModel(),
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
              resizeToAvoidBottomPadding: false,
              resizeToAvoidBottomInset: false,
              key: _key,
              appBar: PreferredSize(
                  child: header(context,
                      isAppTitle: false,
                      isIcon: false,
                      strTitle: "Practical Assessment"),
                  preferredSize: Size.fromHeight(50.0)),
              body: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: model.busy == false
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : SingleChildScrollView(
                              child: PracticalPageWidget(
                              practical: model.posts,
                              practical1: widget.practical,
                              candidate: widget.candidate,
                            )),
                    ),
                  ),
                ),
              ),
            ),
            onWillPop: () => _onWillPop()));
  }

  Future<bool> _onWillPop() async {
    return (await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                    "Are you sure you want to quit the Exam? All your progress will be lost."),
                title: Text("Warning!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  FlatButton(
                    child: Text("No"),
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                  ),
                ],
              );
            })) ??
        false;
  }
}
