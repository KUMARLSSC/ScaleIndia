import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ViewModels/languagepage_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LangugaePage extends StatelessWidget {
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
          body: Column(
                        children: <Widget>[
                          Center(
                              child: Text(
                            "Select an Language:",
                            style: kTitleStyle,
                          )),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(
                              title: "English",
                              onPressed: () {
                               
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "தமிழ்", onPressed:() {
                               
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "हिन्दी", onPressed:() {
                               
                              }),
                          SizedBox(
                            height: 15,
                          ),
                          BusyButton(title: "తెలుగు", onPressed: () {
                              
                              }),
                        ],
                      ),
    )
    );
  }
}
