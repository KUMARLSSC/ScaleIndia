import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/theory_service.dart';
import '../locator.dart';
import 'base_model.dart';

class LanguagePageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final TheoryService _theoryService = locator<TheoryService>();
  final DialogService _dialogService = locator<DialogService>();
  List<Theory> get posts => _theoryService.theory;

  Future getTheory(int resId) async {
    setBusy(false);
    await _theoryService.getTheoryQuestion(resId);
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
