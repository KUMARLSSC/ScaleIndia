import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/candidate_service.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class FourthPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
 final CandidateService _candidateService = locator<CandidateService>();
final DialogService _dialogService = locator<DialogService>();
  List<Candidate> get posts => _candidateService.candidate;

  Future getPosts(int resId) async {
    setBusy(false);
    await _candidateService.getPostsForUser(resId);
    setBusy(true);
  }
  
  void navigateToFifthPage() {
    _navigationService.navigateTo(FifthViewRoute);
  }
  void navigateToCompleted() {
     _dialogService.showDialog(
        title: 'Completed',
        description: 'This candidate completed the theory and practical exams',
      );
  }
}
