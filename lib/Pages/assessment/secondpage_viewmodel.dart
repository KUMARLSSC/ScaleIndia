import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../../locator.dart';
import '../../ViewModels/base_model.dart';

class SecondPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToFourthPage({CenterAssesor centerAssesor}) {
    _navigationService.navigateTo(ThirdViewRoute);
  }
}
