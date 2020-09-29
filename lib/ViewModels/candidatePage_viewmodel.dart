import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class CandidatePageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  
  void navigateToFirstPage() {
    _navigationService.navigateTo(FirstViewRoute);
  }
  void navigateToELearningPage() {
    _navigationService.navigateTo(ElearningViewRoute);
  }
}