import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/Services/api_services.dart';
import '../locator.dart';

class CandidateService {
  Api _api = locator<Api>();

  List<Candidate> _candidate;
  List<Candidate> get candidate => _candidate;

  Future getPostsForUser(int resId) async {
    _candidate = await _api.getCandidateLiST(resId);
  }
}
