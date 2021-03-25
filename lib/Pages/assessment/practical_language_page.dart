import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/Pages/assessment/practical_language_widget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LanguagePage1 extends StatelessWidget {
  final Candidate candidate;
  LanguagePage1({this.candidate});

  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<LanguagePageViewModel>.reactive(
        onModelReady: (model) => model.getPractical(centerAssesor.asId),
        viewModelBuilder: () => LanguagePageViewModel(),
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
                appBar: PreferredSize(
                    child: header(context, isAppTitle: true, isIcon: false),
                    preferredSize: Size.fromHeight(50.0)),
                body: model.busy == false
                    ? Center(
                        child: ColorLoader3(
                          radius: 20.0,
                          dotRadius: 10.0,
                        ),
                      )
                    : Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Center(
                              child: Text(
                            "Select an Language to continue:",
                            style: kTitleStyle,
                          )),
                          _getPostUi1(model.posts1)
                        ],
                      )),
            onWillPop: () => _onWillPop(context)));
  }

  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog<bool>(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Text(
                    "Are you sure you want to quit the Exam? All your progress will be lost."),
                title: Text("Warning!"),
                actions: <Widget>[
                  // ignore: deprecated_member_use
                  FlatButton(
                    child: Text("Yes"),
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                  ),
                  // ignore: deprecated_member_use
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

  Widget _getPostUi1(
    List<Practical> posts,
  ) =>
      new ListView.builder(
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            /* final String english = "English";
            final String tamil = "Tamil";
            final String bangla = "Bangla";*/
            final Map<String, Practical> profileMap = new Map();
            posts.forEach((item) {
              profileMap[item.pqLang] = item;
            });
            posts = profileMap.values.toList();
            final r = posts[index];
            return LanguageWidget1(
              practical: r,
              candidate: candidate,
            );
          });
}
