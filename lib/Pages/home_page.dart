import 'dart:io';

import 'package:Scaleindia/ViewModels/home_viewmodel.dart';
import 'package:Scaleindia/widgets/busy_button.dart';
import 'package:Scaleindia/widgets/internet_connection.dart';
import 'package:Scaleindia/widgets/style_constants.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer advancedPlayer;
  AudioCache audioCache;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  void initPlayer() {
    advancedPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    audioCache.play('welcome.mp3');
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomePageViewModel>.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, model, child) => WillPopScope(
            child: Scaffold(
                body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/img/logo.png",
                        fit: BoxFit.fill,
                        height: 100,
                        width: 250,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Welcomes You",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ConnectionCheck(
                      child: Padding(
                          padding: EdgeInsets.all(1),
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Center(
                                    child: Text(
                                  "Select your role in ScaleIndia",
                                  style: kTitleStyle,
                                )),
                                SizedBox(
                                  height: 15,
                                ),
                                BusyButton(
                                  title: "Employer",
                                  color: Colors.green,
                                  busy: model.busy,
                                  onPressed: () {
                                    model.handleStartUpLogicEmployer();
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BusyButton(
                                  title: 'Candidate',
                                  color: Colors.green,
                                  busy: model.busy,
                                  onPressed: () {
                                    model.navigateToFirstPage();
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BusyButton(
                                  title: 'Employee',
                                  busy: model.busy,
                                  color: Colors.green,
                                  onPressed: () {
                                    model.handleStartUpLogicEmployee();
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BusyButton(
                                  title: 'Trainer',
                                  busy: model.busy,
                                  color: Colors.green,
                                  onPressed: () {
                                    model.navigateToTrainerLoginPage();
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                BusyButton(
                                  title: 'Assessor',
                                  busy: model.busy,
                                  color: Colors.green,
                                  onPressed: () {
                                    model.navigateToAssessorLoginPage();
                                  },
                                ),
                                SizedBox(
                                  height: 80,
                                ),
                                Text(
                                  'About Scale India',
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          )),
                    ),
                  )),
                ],
              ),
            )),
            onWillPop: () => _onWillPop()));
  }

  Future<bool> _onWillPop() async {
    return exit(0);
  }
}
