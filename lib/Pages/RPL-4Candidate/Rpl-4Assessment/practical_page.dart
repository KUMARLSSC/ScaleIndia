import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/Pages/assessment/practicalpage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/Pages/assessment/practicalpage_widget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
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
      onModelReady: (model) => model.getPractical(1),
      viewModelBuilder: () => PracticalPageViewModel(),
      builder: (context, model, child) => Scaffold(
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
                    ? ColorLoader3(
                        radius: 20.0,
                        dotRadius: 10.0,
                      )
                    : PracticalPageWidget(
                        practical: model.posts,
                        practical1: widget.practical,
                        candidate: widget.candidate,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
