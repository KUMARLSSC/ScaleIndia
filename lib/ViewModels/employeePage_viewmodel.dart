import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class EmployeePageViewModel extends BaseModel {

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToEmployeeRegister() {
    _navigationService.navigateTo(EmployeeRegisterViewRoute);
  }

  void navigateToPractical() {
    _navigationService.navigateTo(PracticalViewRoute);
  }
}
