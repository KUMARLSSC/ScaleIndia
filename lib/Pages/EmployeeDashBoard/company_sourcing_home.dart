import 'package:Scaleindia/Pages/EmployeeDashBoard/company_souring_list.dart';
import 'package:Scaleindia/ViewModels/ecas_viewmodel.dart';
import 'package:Scaleindia/shared/ui_helpers.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CompanySourcingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<CreatePostViewModel>.reactive(
        viewModelBuilder: () => CreatePostViewModel(),
        onModelReady: (model) => model.listenToPostsCs(),
        builder: (context, model, child) => Scaffold(
              backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    verticalSpace(35),
                    Expanded(
                        child: model.lists != null
                            ? ListView.builder(
                                itemCount: model.lists.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () {},
                                  child: CompanySourcingList(
                                    height: height,
                                    width: width,
                                    comapanySourcing: model.lists[index],
                                    onDeleteItem: () {},
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
            ));
  }
}
