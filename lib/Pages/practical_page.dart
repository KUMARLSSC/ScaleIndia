import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ViewModels/practicalpage_viewmodel.dart';
import 'package:Scaleindia/widgets/Enablebuttons_widget.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:Scaleindia/widgets/practicalpage_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class PracticalPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Practical practical;
  PracticalPage({this.practical});
  @override
  Widget build(BuildContext context) {
     CenterAssesor centerAssesor = Provider.of<CenterAssesor>(context);
    return ViewModelBuilder<PracticalPageViewModel>.reactive(
      onModelReady: (model) => model.getPractical(centerAssesor.asId),
      viewModelBuilder: () => PracticalPageViewModel(),
      builder: (context, model, child) => Scaffold(
       resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      key: _key,
      appBar: PreferredSize(
          child: header(context,
              isAppTitle: false, isIcon: false, strTitle: "Practical Exam"),
          preferredSize: Size.fromHeight(50.0)),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 30.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                  Colors.blue[900],
                  Colors.blue[800],
                  Colors.blue[400]
                ]),
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    Container(
                      width: 330,
                      height: 600,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      child:  model.busy == false
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : PracticalPageWidget(practical:model.posts),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  /*Widget _getPostUi(List<Practical> practical) => ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: practical.length,
        itemBuilder: (BuildContext context, int index) => PracticalPageWidget(
            practical: practical[index],
            ),
      );*/
}
