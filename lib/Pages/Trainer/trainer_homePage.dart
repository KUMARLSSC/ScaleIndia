import 'package:flutter/material.dart';

class TrainerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Trainer'),
          bottom: new TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
              );
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new ChoiceCard(choice: choice),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return 
        Card(
          color:choice.color,
          margin: EdgeInsets.only(bottom: 420),
          elevation: 7.0,
          child: new Container(
            margin: EdgeInsets.all(7.0),
            padding: EdgeInsets.all(6.0),
            child: new Row(
              children: <Widget>[
                Container(
                  child: Column(
                    children: [
                      Text(
                        choice.time1,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      Text('to'),
                      Text(
                        choice.time2,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  width: 150,
                  child: Column(
                    children: [
                      Text(
                        choice.category,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        choice.type,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.red),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 75,
                    width: 80,
                    child: RaisedButton(
                      splashColor: Colors.blue,
                      elevation: 3.0,
                      color: choice.color1,
                      child: Text(
                        'Start',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ))
              ],
            ),
          ),
    );
  }
}

class Choice {
  const Choice(
      {this.title,
      this.icon,
      this.category,
      this.time1,
      this.time2,
      this.color,
      this.color1,
      this.type});
  final String title;
  final String time1;
  final String time2;
  final String category;
  final Color color;
   final Color color1;
  final String type;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'Sunday',
      color: Colors.yellowAccent,
      time1: '08:00 am',
      category: 'LSS/5501',
      color1: Colors.green,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: 'Monday',
      color: Colors.white,
      time1: '10:00 am',
      color1: Colors.grey,
      category: 'LSS/5501',
      type: 'Cutting Operator Footwear',
      time2: '11:00 pm'),
  const Choice(
      title: 'Tuesday',
      time1: '08:00 am',
      color: Colors.white,
      category: 'LSS/5501',
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: 'Wednesday',
      time1: '08:00 am',
      category: 'LSS/5501',
      color: Colors.white,
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: 'Thursday',
      time1: '08:00 am',
      category: 'LSS/5501',
      color1: Colors.grey,
      color: Colors.white,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: 'Friday',
      time1: '08:00 am',
      color: Colors.white,
      category: 'LSS/5501',
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: 'Saturday',
      time1: '08:00 am',
      color: Colors.white,
      category: 'LSS/5501',
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
];
