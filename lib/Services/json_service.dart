import 'dart:convert';

import 'package:Scaleindia/json_api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class JsonService {
  Future<dynamic> future(@required String requestid) async {
    var url = "http://www.json-generator.com/api/json/get/cfjguBWXqW?indent=2";
    var response = await http.get(url);
    var _scale = List<ScaleIndia>();
    if (response.statusCode == 200 || response.statusCode == 201) {
      var responseJson = json.decode(response.body);
      for (var responseJson in responseJson) {
        _scale.add(ScaleIndia.fromJson(responseJson));
      }
      return responseJson;
    } else if (response.statusCode == 401) {
      throw Exception("Incorrect Email/Password");
    } else {
      return null;
    }
  }
}
