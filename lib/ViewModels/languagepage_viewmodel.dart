import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/practical_services.dart';
import 'package:Scaleindia/Services/theory_service.dart';
import '../locator.dart';
import 'base_model.dart';

class LanguagePageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final TheoryService _theoryService = locator<TheoryService>();
  final PracticalService _practicalService = locator<PracticalService>();
  final DialogService _dialogService = locator<DialogService>();
  List<Theory> get posts => _theoryService.theory;
  List<Practical> get posts1 => _practicalService.practical;

  Future getTheory(int resId) async {
    setBusy(false);
    await _theoryService.getTheoryQuestion(resId);
    setBusy(true);
  }

  Future getPractical(int resId) async {
    setBusy(false);
    await _practicalService.getPracticalQuestion(resId);
    setBusy(true);
  }

  void navigateToTheoryPage() {
    _navigationService.navigateTo(TheoryViewRoute);
  }

  void navigateToCompleted() {
    _dialogService.showDialog(
      title: 'Completed',
      description: 'This candidate completed the theory and practical exams',
    );
  }
}
