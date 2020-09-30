import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class EmployerPageViewModel extends BaseModel {

  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToTheory() {
    _navigationService.navigateTo(LanguageViewRoute);
  }

  void navigateToPractical() {
    _navigationService.navigateTo(PracticalViewRoute);
  }
}
