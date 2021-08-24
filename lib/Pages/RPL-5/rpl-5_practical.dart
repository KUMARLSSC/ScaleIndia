import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/Pages/assessment/practicalpage_viewmodel.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/locator.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/Pages/assessment/practicalpage_widget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class RPL5PracticalPage extends StatefulWidget {
  final Practical practical;
  RPL5PracticalPage({
    this.practical,
  });
  @override
  _PracticalPageState createState() => _PracticalPageState();
}

class _PracticalPageState extends State<RPL5PracticalPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
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
                        busy: true,
                        practical1: widget.practical,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
