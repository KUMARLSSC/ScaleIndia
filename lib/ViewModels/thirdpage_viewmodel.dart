import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/candidate_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class ThirdPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final CandidateService _candidateService = locator<CandidateService>();
  final DialogService _dialogService = locator<DialogService>();

  List<Candidate> get posts => _candidateService.candidate;

  Future getPosts(int resId) async {
    setBusy(false);
    var result = await _candidateService.getPostsForUser(resId);
    setBusy(true);
    if (result) {
      _navigationService.navigateTo(FourthViewRoute);
    } else {
   await _dialogService.showDialog(
        title:'Server Error',
        description: result,
      );
    }
  }

  void navigateToFourthPage() {
    _navigationService.navigateTo(FourthViewRoute);
  }
}
