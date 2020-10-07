import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Manager/dialog_manager.dart';
import 'Models/router.dart';
import 'Pages/splash_page.dart';
import 'Services/dialog_service.dart';
import 'Services/navigation_service.dart';
import 'Services/request_service.dart';
import 'locator.dart';

Future<void> main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CenterAssesor>(
      initialData: CenterAssesor.initial(),
      create: (BuildContext context) =>
          locator<RequestService>().requestController.stream,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scale India',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: new ThemeData(primaryColor: new Color(0xff09031D), fontFamily: 'Avenir'),
      home: SplashPage(),
      onGenerateRoute: generateRoute,
    ),
      );
  }
}
