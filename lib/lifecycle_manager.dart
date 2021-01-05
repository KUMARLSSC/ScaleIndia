import 'dart:async';
import 'package:Scaleindia/Services/background_fetch_service.dart';
import 'package:Scaleindia/Services/location_service.dart';
import 'package:Scaleindia/Services/stoppable_service.dart';
import 'package:Scaleindia/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'Services/dialog_service.dart';

/// Stop and start long running services
class LifeCycleManager extends StatefulWidget {
  final Widget child;
  LifeCycleManager({Key key, this.child}) : super(key: key);

  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  final DialogService _dialogService = locator<DialogService>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int count = 0;
  List<StoppableService> servicesToManage = [
    locator<LocationService>(),
    locator<BackgroundFetchService>(),
  ];

  // Get all services
  void _showScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    var androidInitilize =
        new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    var fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: onNotificationSelect);
  }

  static Future<void> onNotificationSelect(String payload) async {
    print(payload);
  }

  Future _showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer", "This is my channel",
        importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);

    // await fltrNotification.show(
    //     0, "Task", "You created a Task", generalNotificationDetails, payload: "Task");
    var fltrNotification = new FlutterLocalNotificationsPlugin();
    await fltrNotification.show(0, 'Warning!!!',
        'Do not minimize the app during exam', generalNotificationDetails,
        payload: payLoad().toString());
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    servicesToManage.forEach((service) {
      if (state == AppLifecycleState.resumed) {
        service.start();
        Navigator.of(context, rootNavigator: true).pop();
        count++;
        print(count);
      } else {
        service.stop();
        _showNotification();
      }
    });
  }

  Future<void> payLoad() async {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rules'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("- Do not atten any call during exam"),
                Text(
                    " - Do not interact with any other apps during exam Eg:whats app,gmail etc.."),
                Text(
                    " - Do not minimize the app during exam.If you did more than 2 times you will be disqualified")
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                _showScaffold("Press OK again to close the dialog box");
              },
            ),
          ],
        );
      },
    );
  }
}
