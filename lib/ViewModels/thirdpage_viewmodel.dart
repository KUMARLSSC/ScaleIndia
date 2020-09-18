import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/candidate_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import '../locator.dart';
import 'base_model.dart';

class ThirdPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final CandidateService _candidateService = locator<CandidateService>();

  List<Candidate> get posts => _candidateService.candidate;

  Future getPosts(int resId) async {
    setBusy(false);
    await _candidateService.getPostsForUser(resId);
    setBusy(true);
  }

  void navigateToFourthPage() {
    _navigationService.navigateTo(FourthViewRoute);
  }
}
