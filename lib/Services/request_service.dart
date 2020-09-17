import 'dart:async';

import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/locator.dart';

import 'api_services.dart';

class RequestService {
  Api _api = locator<Api>();
  StreamController<CenterAssesor> requestController = StreamController<CenterAssesor>();

  Future request(int resId) async {
    try {
      var fetchedId = await _api.getCenterAssesor(resId);
    var hasId = fetchedId != null;
    if (hasId) {
      requestController.add(fetchedId);
    }
    return hasId ;
    } catch (e) {
       return e.message;
    }
  }
}
