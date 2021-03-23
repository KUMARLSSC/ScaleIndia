import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/assessment/fourthpage_viewmodel.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:Scaleindia/Pages/assessment/participant_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../locator.dart';

class ThirdPage extends StatelessWidget {
  final CenterAssesor centerAssesor;
  final NavigationService _navigationService = locator<NavigationService>();
  ThirdPage({this.centerAssesor});
  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<FourthPageViewModel>.reactive(
        onModelReady: (model) => model.getPosts(centerAssesor.asId),
        viewModelBuilder: () => FourthPageViewModel(),
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
              appBar: PreferredSize(
                  child: header(context, isAppTitle: true, isIcon: false),
                  preferredSize: Size.fromHeight(50.0)),
              body: Container(
                  width: MediaQuery.of(context).size.width - 5.0,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            'Participant List',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Divider(
                          color: Colors.black38,
                          height: 15,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ID',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              'Exam',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.height - 184.0,
                            child: model.busy == false
                                ? Center(
                                    child: ColorLoader3(
                                    radius: 20.0,
                                    dotRadius: 10.0,
                                  ))
                                : _getPostUi(model.posts))
                      ])),
            ),
            onWillPop: () => _onWillPop()));
  }

  Future<bool> _onWillPop() async {
    return _navigationService.navigateTo(SecondViewRoute);
  }

  Widget _getPostUi(List<Candidate> posts) => ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) => ParticipantWidget(
          candidate: posts[index],
          centerAssesor: centerAssesor,
        ),
      );
}
