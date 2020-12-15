import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/Pages/assessment/language_widget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LanguagePage extends StatelessWidget {
  final Candidate candidate;
  final CenterAssesor centerAssesor;
  LanguagePage({this.candidate, this.centerAssesor});
  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<LanguagePageViewModel>.reactive(
        onModelReady: (model) => model.getTheory(centerAssesor.asId),
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
                      _getPostUi(model.posts)
                    ],
                  )));
  }

  Widget _getPostUi(
    List<Theory> posts,
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
                posts.first.tqLanguage == english
                    ? LanguageWidget(
                        candidate: candidate,
                        theory: posts.first,
                        centerAssesor: centerAssesor,
                      )
                    : Container(),
                posts[index].tqLanguage == tamil
                    ? Container()
                    : LanguageWidget(
                        candidate: candidate,
                        centerAssesor: centerAssesor,
                        theory: posts.firstWhere(
                            (element) => element.tqLanguage.contains("Tamil")),
                      ),
                posts.last.tqLanguage == tamil
                    ? Container()
                    : LanguageWidget(
                        candidate: candidate,
                        centerAssesor: centerAssesor,
                        theory: posts.firstWhere(
                            (element) => element.tqLanguage.contains("Hindi")),
                      ),
                posts.last.tqLanguage != bangla
                    ? Container()
                    : LanguageWidget(
                        centerAssesor: centerAssesor,
                        candidate: candidate,
                        theory: posts.firstWhere(
                            (element) => element.tqLanguage.contains("Bangla")),
                      )
              ],
            );
          });
}
