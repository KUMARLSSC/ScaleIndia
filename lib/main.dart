import 'package:Scaleindia/Manager/dialog_manager.dart';
import 'package:Scaleindia/Models/router.dart';
import 'package:Scaleindia/Pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Services/dialog_service.dart';
import 'locator.dart';
import 'services/navigation_service.dart';

void main() {
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