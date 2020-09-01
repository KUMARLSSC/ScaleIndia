import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/first_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case FirstViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: FirstPage(),
      );
      default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('There was a technical error ${settings.name}')),
              ));
  }
}

PageRoute _pageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName), builder: (_) => viewToShow);
}
