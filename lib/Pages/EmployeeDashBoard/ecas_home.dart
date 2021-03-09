import 'package:Scaleindia/Pages/EmployeeDashBoard/ecas_candidate_list.dart';
import 'package:Scaleindia/ViewModels/ecas_viewmodel.dart';
import 'package:Scaleindia/shared/ui_helpers.dart';
import 'package:Scaleindia/widgets/loader_animation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ECASHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ViewModelBuilder<CreatePostViewModel>.reactive(
        viewModelBuilder: () => CreatePostViewModel(),
        onModelReady: (model) => model.listenToPosts(),
        builder: (context, model, child) => Scaffold(
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
            ));
  }
}
