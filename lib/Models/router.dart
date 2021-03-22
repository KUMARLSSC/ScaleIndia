import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Pages/Assessor/assessor_homepage.dart';
import 'package:Scaleindia/Pages/Assessor/sop_page.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/candidate_sourcing.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/company_create.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/company_so_select.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/company_sourcing_home.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/eca_create.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/ecas_home.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/sourcing.dart';
import 'package:Scaleindia/Pages/EmployerDashBoard/employerHome_page.dart';
import 'package:Scaleindia/Pages/EmployerDashBoard/postJob_page.dart';
import 'package:Scaleindia/Pages/EmployerDashBoard/viewJob_page.dart';
import 'package:Scaleindia/Pages/RPL-4/rpl-4_home_page.dart';
import 'package:Scaleindia/Pages/RPL-4/rpl-4_login_page.dart';
import 'package:Scaleindia/Pages/RPL-4/rpl-4_register_page.dart';
import 'package:Scaleindia/Pages/RPL-4/rpl_otp.dart';
import 'package:Scaleindia/Pages/Trainer/trainer_homePage.dart';
import 'package:Scaleindia/Pages/Assessor/assessor_page.dart';
import 'package:Scaleindia/Pages/candidate_page.dart';
import 'package:Scaleindia/Pages/elearning_page.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/employeeDashBoard_page.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/employeeRegister_page.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/employee_page.dart';
import 'package:Scaleindia/Pages/EmployerDashBoard/employerDashBoard_page.dart';
import 'package:Scaleindia/Pages/employerRegister_page.dart';
import 'package:Scaleindia/Pages/employer_page.dart';
import 'package:Scaleindia/Pages/assessment/fourth_page.dart';
import 'package:Scaleindia/Pages/assessment/first_page.dart';
import 'package:Scaleindia/Pages/forgotPassword_Page1.dart';
import 'package:Scaleindia/Pages/forgotPassword_Page2.dart';
import 'package:Scaleindia/Pages/assessment/third_page.dart';
import 'package:Scaleindia/Pages/home_page.dart';
import 'package:Scaleindia/Pages/assessment/theory_langugae_page.dart';
import 'package:Scaleindia/Pages/onBoarding_page.dart';
import 'package:Scaleindia/Pages/assessment/practical_page.dart';
import 'package:Scaleindia/Pages/assessment/summary_page.dart';
import 'package:Scaleindia/Pages/assessment/theory_page.dart';
import 'package:Scaleindia/Pages/assessment/second_page.dart';
import 'package:Scaleindia/Pages/trainer_page.dart';
import 'package:Scaleindia/video_stream/home_page.dart';
import 'package:flutter/material.dart';

CenterAssesor centerAssesor;
String phoneNo;
String sms;
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CompanySouringPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: CompanySourcingSelect(),
      );
    case CandidateSouringPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: CandidateSourcing(),
      );
    case SouringPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: Sourcing(),
      );
    case CompanyHomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: CompanySourcingHome(),
      );
    case ECASHomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ECASHome(),
      );
    case CompanyCreatePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: CompanyCreate(),
      );
    case ECASCreatePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ECASCreate(),
      );
    case RPL4OTPPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: OTPScreen(phoneNo),
      );
    case RPL4RegisterPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: RPL4RegisterPage(),
      );
    case RPL4HomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: RPL4HomePage(),
      );
    case RPL4PageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: RPL4LoginPage(),
      );
    case VideoHomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: VideoHomePage(),
      );
    case SOPViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: SOP(),
      );
    case AssessorHomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: AssessorHomePage(),
      );
    case HomeViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: HomePage(),
      );
    case TrainerHomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: TrainerHomePage(),
      );
    case PostJobPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: PostJobPage(),
      );
    case EmployerHomePageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: EmployerHomePage(),
      );
    case ViewJobPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ViewJobPage(),
      );
    case OnBoardingPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: OnBoardingPage(),
      );
    case AssessorLoginPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: AssessorLoginPage(),
      );
    case TrainerLoginPageViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: TrainerLoginPage(),
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
        viewToShow: ForgotPage1(),
      );
    case ForgotPage2ViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ForgotPage2(),
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
        viewToShow: SecondPage(
          centerAssesor: centerAssesor,
        ),
      );
    case ThirdViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: ThirdPage(
          centerAssesor: centerAssesor,
        ),
      );
    case FourthViewRoute:
      return _pageRoute(
        routeName: settings.name,
        viewToShow: FourthPage(),
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
