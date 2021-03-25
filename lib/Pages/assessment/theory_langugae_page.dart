import 'dart:async';

import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/Pages/assessment/theory_language_widget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LanguagePage extends StatelessWidget {
  final Candidate candidate;
  final CenterAssesor centerAssesor;
  LanguagePage({
    this.candidate,
    this.centerAssesor,
  });
  void initPlayer() {
    AudioPlayer advancedPlayer;
    AudioCache audioCache;
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    audioCache.play('rules.mp3');
  }

  Future<void> _rules(BuildContext context) async {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rules'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("- Do not atten any call during exam"),
                Text(
                    " - Do not interact with any other apps during exam Eg:whats app,gmail,facebooketc.."),
                Text(" - Do not minimize the app during exam"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Timer.run(() => initPlayer());
    Timer.run(() => _rules(context));
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<LanguagePageViewModel>.reactive(
        onModelReady: (model) => model.getTheory(centerAssesor.asId),
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
                          _getPostUi(model.posts)
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

  Widget _getPostUi(
    List<Theory> posts,
  ) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: posts.length,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            /* final String english = "English";
            final String tamil = "Tamil";
            final String bangla = "Bangla";*/
            final Map<String, Theory> profileMap = new Map();
            posts.forEach((item) {
              profileMap[item.tqLanguage] = item;
            });
            posts = profileMap.values.toList();
            final r = posts[index];
            return LanguageWidget(
              candidate: candidate,
              theory: r,
              centerAssesor: centerAssesor,
            );
          });
}
