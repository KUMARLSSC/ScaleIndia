import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class TrainerPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  
  void navigateToTrainerHomePage() {
    _navigationService.navigateTo(TrainerHomePageViewRoute);
  }
}
