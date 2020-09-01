import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class FirstPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  

  void navigateToSecondPage() {
    _navigationService.navigateTo(SecondViewRoute);
  }
}
