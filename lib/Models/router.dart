import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/candidate_page.dart';
import 'package:Scaleindia/Pages/elearning_page.dart';
import 'package:Scaleindia/Pages/employeeDashBoard_page.dart';
import 'package:Scaleindia/Pages/employeeRegister_page.dart';
import 'package:Scaleindia/Pages/employee_page.dart';
import 'package:Scaleindia/Pages/employerDashBoard_page.dart';
import 'package:Scaleindia/Pages/employerRegister_page.dart';
import 'package:Scaleindia/Pages/employer_page.dart';
import 'package:Scaleindia/Pages/fifth_page.dart';
import 'package:Scaleindia/Pages/first_page.dart';
import 'package:Scaleindia/Pages/forgotPassword_Page1.dart';
import 'package:Scaleindia/Pages/forgotPassword_Page2.dart';
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
      case EmployerViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployerPage(),
      );
       case EmployerRegisterViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployerRegisterPage(),
      );
       case ForgotPage1ViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow:ForgotPage1(),
      );
      case ForgotPage2ViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow:ForgotPage2(),
      );
       case EmployeeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployeePage(),
      );
       case EmployeeRegisterViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployeeRegisterPage(),
      );
      case EmployerDashBoardViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployerDashBoardPage(),
      );
       case EmployeeDashBoardViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployeeDashBoardPage(),
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
