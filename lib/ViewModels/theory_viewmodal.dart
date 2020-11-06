import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/theory_service.dart';
import '../locator.dart';
import 'base_model.dart';

class TheoryPageViewModel extends BaseModel {
  final TheoryService _theoryService = locator<TheoryService>();

  // ignore: unused_field
  final DialogService _dialogService = locator<DialogService>();
  List<Theory> get posts => _theoryService.theory;

  Future getTheory(int resId) async {
    setBusy(false);
    await _theoryService.getTheoryQuestion(resId);
    setBusy(true);
  }

  // ignore: missing_return
  Future<bool> navigateToSummary() async {
    _dialogService.showConfirmationDialog(
      title: "Warning!",
      description:
          "Are you sure you want to quit the exam? All your progress will be lost.",
    );
  }
}
