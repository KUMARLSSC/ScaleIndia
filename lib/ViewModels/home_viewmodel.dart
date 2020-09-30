import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class HomePageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  
  void navigateToFirstPage() {
    _navigationService.navigateTo(CandidateViewRoute);
  }
   void navigateToEmployerPage() {
    _navigationService.navigateTo(EmployerViewRoute);
  }
  void navigateToEmployeePage() {
    _navigationService.navigateTo(EmployeeViewRoute);
  }
}
