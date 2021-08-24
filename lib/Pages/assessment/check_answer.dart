import 'package:ScaleIndia/ApiModel/theory_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:html_unescape/html_unescape_small.dart';

class CheckAnswersPage extends StatelessWidget {
  List<Theory> questions = [];
  final Map<int, dynamic> answers;

  CheckAnswersPage({Key key, @required this.questions, @required this.answers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index;
    List data = [];
    for (int i = 0; i < questions.length; i++)
      data.add({
        'Nos': questions[i].tqNos,
        'slno': 1,
        'Question': questions[i].tqQuestion,
        'correctAnswer': questions[i].tqCorrectAnswer,
        'givenAnswer': answers[index],
        'MarksGiven': questions[i].tqCorrectAnswer == answers[index] ? 1 : 0,
      });
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Answers'),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
              height: 200,
            ),
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: questions.length,
                  itemBuilder: _buildItem,
                ),
              ),
              RaisedButton(
                child: Text("submit"),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('TheoryMark')
                      .doc()
                      .set({
                    'candidateID': '123',
                    'candidateName': 'Abc',
                    'Answersheet': FieldValue.arrayUnion(data.toList()),
                    'UploadDate&Time': FieldValue.serverTimestamp()
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    Theory question1 = questions[index];
    List data = [];
    for (int i = 0; i < questions.length; i++)
      data.add({
        'Nos': question1.tqNos,
        'slno': 1,
        'Question': question1.tqQuestion,
        'correctAnswer': question1.tqCorrectAnswer,
        'givenAnswer': answers[index],
        'MarksGiven': question1.tqCorrectAnswer == answers[index] ? 1 : 0,
      });
    if (index == questions.length - 1) {
      return RaisedButton(
        child: Text("Done"),
        onPressed: () {
          FirebaseFirestore.instance.collection('TheoryMark').doc().set({
            'candidateID': '123',
            'candidateName': 'Abc',
            'Answersheet': FieldValue.arrayUnion(data.toList()),
            'UploadDate&Time': FieldValue.serverTimestamp()
          });
        },
      );
    }
    Theory question = questions[index];
    bool correct = question.tqCorrectAnswer == answers[index];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              HtmlUnescape().convert(question.tqQuestion),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0),
            ),
            SizedBox(height: 5.0),
            Text(
              HtmlUnescape().convert("${answers[index].toString()}"),
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
                          text: HtmlUnescape()
                              .convert(question.tqCorrectAnswer.toString()),
                          style: TextStyle(fontWeight: FontWeight.w500))
                    ]),
                    style: TextStyle(fontSize: 16.0),
                  )
          ],
        ),
      ),
    );
  }
}
