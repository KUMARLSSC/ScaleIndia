import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Pages/RPL-5/proctoring_theory.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/busy_button.dart';

class RPL5TheoryLanguageWidget extends StatelessWidget {
  final Theory theory;
  RPL5TheoryLanguageWidget({
    this.theory,
  });
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
                      title: theory.tqLanguage,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RPL5TheoryProctoring(
                                      theory: theory,
                                    )));
                      }),
                ],
              ),
            ));
  }
}
