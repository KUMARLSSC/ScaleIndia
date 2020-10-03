import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/practical_services.dart';
import '../locator.dart';
import 'base_model.dart';

class PracticalPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final PracticalService _practicalService = locator<PracticalService>();
  // ignore: unused_field
  final DialogService _dialogService = locator<DialogService>();
  List<Practical> get posts => _practicalService.practical;

  Future getPractical(int resId) async {
    setBusy(false);
    await _practicalService.getPracticalQuestion(resId);
    setBusy(true);
  }

  void navigateToSummary() {
    _navigationService.navigateTo(SummaryViewRoute);
  }
}
