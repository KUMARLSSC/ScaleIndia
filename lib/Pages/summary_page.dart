import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/widgets/HeaderWidget.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final List<Theory> theory;
  final Map<int, dynamic> answers;
  const SummaryPage({
    Key key,
    this.theory,
    this.answers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: header(context,
              isAppTitle: false, isIcon: false, strTitle: "Summary"),
          preferredSize: Size.fromHeight(50.0)),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: theory.length - 1,
          itemBuilder: _buildTheory,
        ),
      ),
    );
  }

  Widget _buildTheory(BuildContext context, int index) {
    Theory question = theory[index];

    return Card(
        color: answers[index] != null ? Colors.green : Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                question.tqQuestion,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0),
              ),
            ],
          ),
        ));
  }
}
