import 'dart:async';

import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/locator.dart';

import 'api_services.dart';

class RequestService {
  Api _api = locator<Api>();
  StreamController<Theory> requestController = StreamController<Theory>();

  Future<bool> request(int resId) async {
    var fetchedId = await _api.getTheoryQuestions(resId);
    var hasId = fetchedId != null;
    if (hasId) {
      requestController.add(fetchedId);
    }
    return hasId;
  }
}
