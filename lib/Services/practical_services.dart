import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/Services/api_services.dart';
import '../locator.dart';


class PracticalService {
  Api _api = locator<Api>();

  List<Practical> _practical;
  List<Practical> get theory => _practical;

  Future getTheoryQuestion(int resId) async {
    _practical = await _api.getPractical(resId);
  }

} 
