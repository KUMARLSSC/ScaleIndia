import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/theory_service.dart';
import '../locator.dart';
import 'base_model.dart';

class TheoryPageViewModel extends BaseModel {
 
  final NavigationService _navigationService = locator<NavigationService>();
  final TheoryService _theoryService = locator<TheoryService>();
  // ignore: unused_field
  final DialogService _dialogService = locator<DialogService>();
  List<Theory> get posts => _theoryService.theory;

  Future getTheory(int resId) async {
    setBusy(false);
    await _theoryService.getTheoryQuestion(resId);
    setBusy(true);
  }
  void navigateToSummary() {
    _navigationService.navigateTo(SummaryViewRoute);
  }
 
}
