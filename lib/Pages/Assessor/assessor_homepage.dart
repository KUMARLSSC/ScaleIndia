import 'package:Scaleindia/Pages/Assessor/assessor_widget.dart';
import 'package:Scaleindia/Pages/Assessor/bottom_sheet.dart';
import 'package:Scaleindia/Pages/Assessor/assessor_viewmodel.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AssessorHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AssessorPageViewModel>.reactive(
      viewModelBuilder: () => AssessorPageViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
            child: header(context,
                isAppTitle: false,
                isIcon: false,
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: Color(0xffE6E6E6),
                    child: Icon(
                      Icons.person,
                      color: Color(0xffCCCCCC),
                    ),
                  ),
                ),
                centerTitle: true,
                disappearedBackButton: false,
                action: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.notifications),
                  )
                ],
                strTitle: "Pranjal - 123456"),
            preferredSize: Size.fromHeight(50.0)),
        body: Container(
            width: MediaQuery.of(context).size.width - 5.0,
            decoration: BoxDecoration(color: Colors.white),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: Text(
                  'Assessment info',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                color: Colors.black38,
                height: 15,
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: AssessorWidget(),
              )
            ])),
      ),
    );
  }

  Future _asyncSimpleDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: const Text('Please activate by uploading photo '),
              children: [
                BottomSheetWidget(),
              ]);
        });
  }
}
