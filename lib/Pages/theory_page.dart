import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ViewModels/theory_viewmodal.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/options_widget.dart';
import 'package:Scaleindia/widgets/timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class TheoryPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<TheoryPageViewModel>.reactive(
      onModelReady: (model) => model.getTheory(centerAssesor.asId),
      viewModelBuilder: () => TheoryPageViewModel(),
      builder: (context, modal, child) => Scaffold(
        key: _key,
        appBar: PreferredSize(
            child: header(context,
                isAppTitle: false, isIcon: false, strTitle: "Theory Exam"),
            preferredSize: Size.fromHeight(50.0)),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height - 30.0,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: kBlack
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(7),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "Candidate ID:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                TextSpan(
                                    text: "1234567890",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.bold)),
                              ])),
                            ),
                            Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Time Left:",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                TimerLeft()
                              ],
                            ),
                            Divider(
                              color: Colors.black38,
                              height: 15,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              height: 500,
                              child: modal.busy == false
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        backgroundColor: Colors.white,
                                      ),
                                    )
                                  : SingleChildScrollView(
                                      child: Options(
                                      theory: modal.posts,
                                    )),
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
