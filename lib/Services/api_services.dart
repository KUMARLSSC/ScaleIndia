import 'dart:convert';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ApiModel/practical_result_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:http/http.dart' as http;

class Api {
  static const urlpoint =
      'https://webapplication320200218110357.azurewebsites.net';
  var client = new http.Client();

  Future<CenterAssesor> getCenterAssesor(int resId) async {
    var response = await client.get('$urlpoint/api/CenterAssesorInfo/$resId');
    final jsonresponse = json.decode(response.body);

    return CenterAssesor.fromJson(jsonresponse);
  }

  Future<List<Candidate>> getCandidateLiST(int resId) async {
    var _candidate = List<Candidate>();
    // Get user posts for id
    var response = await client.get('$urlpoint/api/CandidateList/$resId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _candidate.add(Candidate.fromJson(candidate));
    }

    return _candidate;
  }

  Future<List<Theory>> getTheory(int resId) async {
    var _theory = List<Theory>();
    // Get user posts for id
    var response = await client.get('$urlpoint/api/TheoryQuestion/$resId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _theory.add(Theory.fromJson(candidate));
    }

    return _theory;
  }

  Future<List<Practical>> getPractical(int resId) async {
    var _practical = List<Practical>();
    // Get user posts for id
    var response = await client.get('$urlpoint/api/PracticalQuestion/$resId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _practical.add(Practical.fromJson(candidate));
    }

    return _practical;
  }

  Future<List<PracticalResult>> updatePractical(
    int prbatchId,
    String prCandidateId,
    int prQuestionId,
    int prMarks,
    String prNos,
    bool prType,
    dynamic prNosNavigation,
    dynamic prQuestion,
    dynamic prbatch,
  ) async {
    var body = {
      "prbatchId": prbatchId,
      "prCandidateId": prCandidateId,
      "prQuestionId": prQuestionId.toString(),
      "prMarks": prMarks.toString(),
      "prNos": prNos,
      "prType": prType,
      "prNosNavigation": prNosNavigation,
      "prQuestion": prQuestion,
      "prbatch": prbatch
    };
    final response = await http.post(
        'https://webapplication320200218110357.azurewebsites.net/api/PracticalResult',
        body: [body]);
    print(response.body);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      return practicalResultFromJson(responseString);
    } else {
      return throw Exception(response.body);
    }
  }

  Future<List<PracticalResult>> updateTheory(List<PracticalResult> list) async {
    var body = json.encode(list);
    final response = await client.post(
        'https://webapplication320200218110357.azurewebsites.net/api/PracticalResult',
        body: body,
        headers: {'Content-type': 'application/json; charset=UTF-8'});
    print(response.headers);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      return practicalResultFromJson(responseString);
    } else {
      return throw Exception(response.body);
    }
  }
}
