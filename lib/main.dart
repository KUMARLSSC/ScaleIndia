

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Manager/dialog_manager.dart';
import 'Models/router.dart';
import 'Pages/splash_page.dart';
import 'Services/dialog_service.dart';
import 'Services/navigation_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scale India',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: new ThemeData(primaryColor: new Color(0xff09031D)),
      home: SplashPage(),
      onGenerateRoute: generateRoute,
    );
  }
}