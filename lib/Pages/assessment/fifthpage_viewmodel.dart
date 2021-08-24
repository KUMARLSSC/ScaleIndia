import 'package:ScaleIndia/Services/dialog_service.dart';
import '../../locator.dart';
import '../../ViewModels/base_model.dart';

class FifthPageViewModel extends BaseModel {
  final DialogService _dialogService = locator<DialogService>();

  void navigateToTheory() {
    _dialogService.showDialog(
      title: 'Completed',
      description: 'Theory was completed successfully',
    );
  }

  void navigateToPractical() {
    _dialogService.showDialog(
      title: 'Completed',
      description: 'Practical was completed successfully',
    );
  }
}
