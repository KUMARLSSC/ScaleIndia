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
    var response =
        await client.get(Uri.parse('$urlpoint/api/CenterAssesorInfo/$resId'));
    final jsonresponse = json.decode(response.body);

    return CenterAssesor.fromJson(jsonresponse);
  }

  Future<List<Candidate>> getCandidateLiST(int resId) async {
    // ignore: deprecated_member_use
    var _candidate = List<Candidate>();
    // Get user posts for id
    var response =
        await client.get(Uri.parse('$urlpoint/api/CandidateList/$resId'));

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _candidate.add(Candidate.fromJson(candidate));
    }

    return _candidate;
  }

  Future<List<Theory>> getTheory(int resId) async {
    // ignore: deprecated_member_use
    var _theory = List<Theory>();
    // Get user posts for id
    var response =
        await client.get(Uri.parse('$urlpoint/api/TheoryQuestion/$resId'));

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _theory.add(Theory.fromJson(candidate));
    }

    return _theory;
  }

  Future<List<Practical>> getPractical(int resId) async {
    // ignore: deprecated_member_use
    var _practical = List<Practical>();
    // Get user posts for id
    var response =
        await client.get(Uri.parse('$urlpoint/api/PracticalQuestion/$resId'));

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _practical.add(Practical.fromJson(candidate));
    }

    return _practical;
  }

  Future<List<PracticalResult>> updatePractical(
      List<PracticalResult> list) async {
    var body = json.encode(list);
    final response = await client.post(
        Uri.parse(
            'https://webapplication320200218110357.azurewebsites.net/api/PracticalResult'),
        body: body,
        headers: {'Content-type': 'application/json; charset=UTF-8'});
    print(response.headers);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      return practicalResultFromJson(responseString);
    } else {
      return null;
    }
  }

  Future<List<PracticalResult>> updateTheory(List<PracticalResult> list) async {
    var body = json.encode(list);
    final response = await client.post(
        Uri.parse(
            'https://webapplication320200218110357.azurewebsites.net/api/PracticalResult'),
        body: body,
        headers: {'Content-type': 'application/json; charset=UTF-8'});
    print(response.headers);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      return practicalResultFromJson(responseString);
    } else {
      return null;
    }
  }
}
