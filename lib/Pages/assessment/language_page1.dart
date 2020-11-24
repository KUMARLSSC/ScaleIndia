import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/language_widget1.dart';
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
        builder: (context, model, child) => Scaffold(
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
                  )));
  }

  Widget _getPostUi1(
    List<Practical> posts,
  ) =>
      ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (
            BuildContext context,
            int index,
          ) {
            final String english = "English";
            final String tamil = "Tamil";
            final String bangla = "Bangla";
            return Column(
              children: [
                posts.first.pqLang == english
                    ? LanguageWidget1(
                        practical: posts.first,
                        candidate: candidate,
                      )
                    : Container(),
                posts[index].pqLang == tamil
                    ? Container()
                    : LanguageWidget1(
                        candidate: candidate,
                        practical: posts.firstWhere(
                            (element) => element.pqLang.contains("Tamil")),
                      ),
                posts.last.pqLang == tamil
                    ? Container()
                    : LanguageWidget1(
                        candidate: candidate,
                        practical: posts.firstWhere(
                            (element) => element.pqLang.contains("Hindi")),
                      ),
                posts.last.pqLang != bangla
                    ? Container()
                    : LanguageWidget1(
                        candidate: candidate,
                        practical: posts.firstWhere(
                            (element) => element.pqLang.contains("Bangla")),
                      )
              ],
            );
          });
}
