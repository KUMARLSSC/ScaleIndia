import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class FifthPageViewModel extends BaseModel {
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToTheory() {
    _navigationService.navigateTo(TheoryViewRoute);
  }

  void navigateToPractical() {
    _navigationService.navigateTo(PracticalViewRoute);
  }
}
