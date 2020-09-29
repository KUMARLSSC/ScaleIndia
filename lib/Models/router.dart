import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/candidate_page.dart';
import 'package:Scaleindia/Pages/elearning_page.dart';
import 'package:Scaleindia/Pages/fifth_page.dart';
import 'package:Scaleindia/Pages/first_page.dart';
import 'package:Scaleindia/Pages/fourth_page.dart';
import 'package:Scaleindia/Pages/home_page.dart';
import 'package:Scaleindia/Pages/langugae_page.dart';
import 'package:Scaleindia/Pages/practical_page.dart';
import 'package:Scaleindia/Pages/second_page.dart';
import 'package:Scaleindia/Pages/summary_page.dart';
import 'package:Scaleindia/Pages/theory_page.dart';
import 'package:Scaleindia/Pages/third_page.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    case CandidateViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: CandidatePage(),
      );
      case ElearningViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ELearningPage(),
      );
    case FirstViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: FirstPage(),
      );
    case SecondViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: SecondPage(),
      );
    case ThirdViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ThirdPage(),
      );
    case FourthViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: FourthPage(),
      );
    case FifthViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: FifthPage(),
      );
    case TheoryViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: TheoryPage(),
      );
    case PracticalViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: PracticalPage(),
      );
    case SummaryViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: SummaryPage(),
      );
    case LanguageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: LanguagePage(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child:
                        Text('There was a technical error ${settings.name}')),
              ));
  }
}

PageRoute _pageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(name: routeName), builder: (_) => viewToShow);
}
