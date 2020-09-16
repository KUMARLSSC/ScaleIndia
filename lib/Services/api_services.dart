import 'dart:convert';

import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:http/http.dart' as http;

class Api {
  static const theorypoint =
      'https://webapplication320200218110357.azurewebsites.net';
  var client = new http.Client();

  Future<Theory> getTheoryQuestions(int resId) async {
    var response = await client.get('$theorypoint/api/TheoryQuestion/$resId');
    final jsonresponse = json.decode(response.body);

    return Theory.fromJson(jsonresponse[0]);
  }
}
