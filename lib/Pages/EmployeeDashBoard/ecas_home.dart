import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/ecas_candidate_list.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/employeePage_viewmodel.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/locator.dart';
import 'package:Scaleindia/shared/ui_helpers.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ECASHome extends StatelessWidget {
  final NavigationService _navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<EmployeePageViewModel>.reactive(
        viewModelBuilder: () => EmployeePageViewModel(),
        onModelReady: (model) => model.listenToPosts1(),
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    verticalSpace(35),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                          child: Image.asset('assets/images/title.png'),
                        ),
                      ],
                    ),
                    Expanded(
                        child: model.posts != null
                            ? ListView.builder(
                                itemCount: model.posts.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: EcasCandidateList(
                                    height: height,
                                    width: width,
                                    employeeCandidateSourcing:
                                        model.posts[index],
                                    onDeleteItem: () => model.deletePost(index),
                                  ),
                                ),
                              )
                            : Center(
                                child: ColorLoader3(
                                radius: 20.0,
                                dotRadius: 10.0,
                              )))
                  ],
                ),
              ),
            ),
            onWillPop: () => _onWillPop()));
  }

  Future<bool> _onWillPop() async {
    return _navigationService.navigateTo(CandidateSouringPageViewRoute);
  }
}
