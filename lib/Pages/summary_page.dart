import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final List<Theory> theory;
  const SummaryPage({
    Key key,
    this.theory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: theory.length+1,
            itemBuilder: _buildTheory,

          ),
    );
  }

  Widget _buildTheory(BuildContext context, int index) {
    Theory question = theory[index];
    return Card(
      child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Text(question.tqQuestion, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.0
            ),),
        ],),
        )
      );
  }
}
