import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:Scaleindia/video_stream/home_page.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/busy_button.dart';

class LanguageWidget1 extends StatelessWidget {
  final Practical practical;
  final Candidate candidate;
  LanguageWidget1({this.practical, this.candidate});
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguagePageViewModel>.reactive(
        viewModelBuilder: () => LanguagePageViewModel(),
        builder: (context, model, child) => Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BusyButton(
                      color: Colors.green,
                      title: practical.pqLang,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoHomePage(
                                      practical: practical,
                                      candidate: candidate,
                                    )));
                      }),
                ],
              ),
            ));
  }
}
