import 'package:Scaleindia/Services/dialog_service.dart';
import '../locator.dart';
import 'base_model.dart';

class FifthPageViewModel extends BaseModel {
  final DialogService _dialogService = locator<DialogService>();

  

  void navigateToTheory() {
    _dialogService.showDialog(
        title: 'Complete profile',
        description:
            'Please upload your photo & aadhar card for  continue theory and practical exam');
  }
}
