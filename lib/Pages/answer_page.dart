/*import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/Services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';

import '../locator.dart';

class AnswerPage extends StatelessWidget {
  final List<Theory> theory;
  final Map<int, dynamic> answers;
  final Candidate candidate;
  final Api _api = locator<Api>();

  AnswerPage(
      {Key key, @required this.theory, @required this.answers, this.candidate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Answers'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 200,
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: theory.length + 1,
            itemBuilder: _buildItem,
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    int correct1 = 0;
    this.answers.forEach((index, value) {
      if (this.theory[index].tqCorrectAnswer == value) correct1++;
    });
    if (index == theory.length) {
      return RaisedButton(
        child: Text("Done"),
        onPressed: () {
          Navigator.of(context)
              .popUntil(ModalRoute.withName(Navigator.defaultRouteName));
        },
      );
    }
    Theory question = theory[index];
    bool correct = question.tqCorrectAnswer == answers[index];
    _api.updateTheory(
      this.candidate.clEnrollmentNo,
      1,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct ? this.theory[index].tqMarks : 0,
      correct1,
      null,
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              question.tqQuestion,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            SizedBox(height: 5.0),
            Text(
              "${answers[index]}",
              style: TextStyle(
                  color: correct ? Colors.green : Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.0),
            correct
                ? Container()
                : Text.rich(
                    TextSpan(children: [
                      TextSpan(text: "Answer: "),
                      TextSpan(
                          text: question.tqCorrectAnswer.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ]),
                    style: TextStyle(fontSize: 16.0),
                  ),
            SizedBox(height: 5.0),
            correct ? Text(this.theory[index].tqMarks.toString()) : Text("0"),
          ],
        ),
      ),
    );
  }
}*/
