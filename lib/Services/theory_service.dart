import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/Services/api_services.dart';
import '../locator.dart';


class TheoryService {
  Api _api = locator<Api>();

  List<Theory> _theory;
  List<Theory> get theory => _theory;

  Future getTheoryQuestion(int resId) async {
    _theory = await _api.getTheory(resId);
  }

} 
