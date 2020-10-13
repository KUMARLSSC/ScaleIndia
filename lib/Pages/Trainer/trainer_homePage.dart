import 'package:flutter/material.dart';
import 'package:simple_pdf_viewer/simple_pdf_viewer.dart';

class TrainerHomePage extends StatefulWidget {
  @override
  _TrainerHomePageState createState() => _TrainerHomePageState();
}

class _TrainerHomePageState extends State<TrainerHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 7,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        setState(() {
          _tabController.index = 0;
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: const Text('Trainer'),
          bottom: new TabBar(
            controller: _tabController,
            isScrollable: true,
            indicatorColor: Colors.white,
            tabs: choices.map((Choice choice) {
              return Container(
                  width: 120,
                  color: choice.colorContainer,
                  child: new Tab(
                    text: choice.title,
                  ));
            }).toList(),
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: choices.map((Choice choice) {
            return new Padding(
              padding: const EdgeInsets.all(2.0),
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
    return new Container(
        color: Colors.yellow,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Table(
              border: TableBorder.all(width: 1.0, color: Colors.black),
              children: <TableRow>[
                TableRow(children: [
                  Text(
                    'Unit Title and course outcomes',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'Key Learning Outcome of the Planned Content delivery',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  Column(
                    children: [
                      TableCell(
                          child: Text(
                        'Planned date for content delivery (hrs)',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      )),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          TableCell(
                            child: Text(
                              'Theory',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            height: 37,
                            width: 1,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          TableCell(
                            child: Text(
                              'Practical',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ]),
                TableRow(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      TableCell(
                        child: Text(
                          'Overview on Leather Industry and Generic Skills Theory Duration (hh:mm) Pratctical Duration (hh:mm) Corrsponding Nos Code Bring ',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TableCell(
                        child: Text(
                            '1.Discuss the leather industry,stiching operation in footwear sector and generic skills'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TableCell(
                        child: Text(
                            '1.Explain importance of leather industry describe manufacturing processs'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TableCell(
                        child: Text(
                            '1.Explain general hazards or risk that can lead to accidents\n\n2.Follow basic safty,healthy and hygenic measures\n\n3.Carry out communication effectively with co-workers in writing as well as orally\n\n4.Read the document that are necessary them to read to carry out operators task '),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          TableCell(
                            child: Text(
                              '    \t4',
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 124,
                            width: 1,
                            color: Colors.black,
                          ),
                          TableCell(
                            child: Text(
                              '    \t2',
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          TableCell(
                            child: Text(
                              '    \t4',
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 124,
                            width: 1,
                            color: Colors.black,
                          ),
                          TableCell(
                            child: Text(
                              '    \t2',
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          TableCell(
                            child: Text(
                              '    \t5',
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 500,
                            width: 1,
                            color: Colors.black,
                          ),
                          TableCell(
                            child: Text(
                              '    \t5',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 30,
                width: 150,
                child: RaisedButton(
                  splashColor: Colors.blue,
                  elevation: 3.0,
                  color: Colors.green,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: AppBar(
                            title: const Text('LSS/Q2501'),
                          ),
                          body: SimplePdfViewerWidget(
                            completeCallback: (bool result) {
                              print("completeCallback,result:$result");
                            },
                            initialUrl:
                                "https://firebasestorage.googleapis.com/v0/b/scale-india.appspot.com/o/Stitching%20operator_Demo%20for%20trainer.pdf?alt=media&token=fcd8a434-e8fa-46f6-9069-07fbe02d102d",
                          ),
                        ),
                      ),
                    );
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                )),
            SizedBox(
              height: 10,
            ),
          ],
        )));
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
      this.colorContainer,
      this.type});
  final String title;
  final String time1;
  final String time2;
  final String category;
  final Color color;
  final Color color1;
  final String type;
  final Color colorContainer;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: '15-Oct',
      color: Colors.yellowAccent,
      time1: '08:00 am',
      colorContainer: Colors.red,
      category: 'LSS/5501',
      color1: Colors.green,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: '16-Oct',
      color: Colors.white,
      time1: '10:00 am',
      colorContainer: null,
      color1: Colors.grey,
      category: 'LSS/5501',
      type: 'Cutting Operator Footwear',
      time2: '11:00 pm'),
  const Choice(
      title: '17-Oct',
      time1: '08:00 am',
      color: Colors.white,
      category: 'LSS/5501',
      colorContainer: null,
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: '18-Oct',
      time1: '08:00 am',
      category: 'LSS/5501',
      colorContainer: null,
      color: Colors.white,
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: '19-Oct',
      time1: '08:00 am',
      category: 'LSS/5501',
      colorContainer: null,
      color1: Colors.grey,
      color: Colors.white,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: '20-Oct',
      time1: '08:00 am',
      color: Colors.white,
      category: 'LSS/5501',
      colorContainer: null,
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
  const Choice(
      title: '21-Oct',
      time1: '08:00 am',
      color: Colors.white,
      category: 'LSS/5501',
      colorContainer: null,
      color1: Colors.grey,
      type: 'Cutting Operator Footwear',
      time2: '09:00 am'),
];
