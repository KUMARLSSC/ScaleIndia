import 'package:ScaleIndia/Models/route_names.dart';
import 'package:ScaleIndia/Services/authentication_service.dart';
import 'package:ScaleIndia/Services/navigation_service.dart';

import '../../locator.dart';
import '../../ViewModels/base_model.dart';

class CandidatePageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  void navigateToFirstPage() {
    _navigationService.navigateTo(FirstViewRoute);
  }

  void navigateToELearningPage() {
    _navigationService.navigateTo(ElearningViewRoute);
  }

  Future handleStartUpLogicRPL4() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedInRPL4();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(RPL4HomePageViewRoute);
    } else {
      _navigationService.navigateTo(EmployerViewRoute);
    }
  }

  void navigateToRPL4CandidateLoginPage() {
    _navigationService.navigateTo(RPL4PageViewRoute);
  }

  void navigateToRPL4Category() {
    _navigationService.navigateTo(Rpl4CategoryViewRoute);
  }

  void navigateToRPL4AdminLogin() {
    _navigationService.navigateTo(Rpl4AdminViewRoute);
  }

  void navigateToRPL5Login() {
    _navigationService.navigateTo(RPL5Login);
  }
}
