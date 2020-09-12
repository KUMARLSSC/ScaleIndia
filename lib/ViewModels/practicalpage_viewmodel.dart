import 'package:Scaleindia/List/questions_list.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/locator.dart';
import 'package:Scaleindia/widgets/practicalpage_widget.dart';
import 'package:flutter/material.dart';

class PracticalViewModel extends StatefulWidget {
  @override
  _PracticalViewModelState createState() => _PracticalViewModelState();
}

class _PracticalViewModelState extends State<PracticalViewModel> {
  final DialogService _dialogService = locator<DialogService>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: questions.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemBuilder: (context, index) {
          var activity = questions[index];
          return PracticalPageWidget(
            questions: activity,
          );
        },
      ),
    );
  }

  void validating() {
    _dialogService.showDialog(
       title: "Failed",
        description: 'Please complete all the questions or check whether you attened all the questions or not',
    );
  }
}
