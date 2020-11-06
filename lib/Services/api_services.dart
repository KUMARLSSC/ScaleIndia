import 'dart:convert';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:Scaleindia/ApiModel/practical_api.dart';
import 'package:Scaleindia/ApiModel/theory_api.dart';
import 'package:Scaleindia/ApiModel/theory_result_api.dart';
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

  Future<List<TheoryResult>> updateTheory(
    String trCandidateId,
    int trbatchId,
    int trMarks1,
    int trMarks2,
    int trMarks3,
    int trMarks4,
    int trMarks5,
    int trMarks6,
    int trMarks7,
    int trMarks8,
    int trMarks9,
    int trMarks10,
    int trMarks11,
    int trMarks12,
    int trMarks13,
    int trMarks14,
    int trMarks15,
    int trMarks16,
    int trMarks17,
    int trMarks18,
    int trMarks19,
    int trMarks20,
    int trTotalMarks,
    dynamic trbatch,
    List<dynamic> tblFinalResult,
  ) async {
    var body = {
      "trCandidateId": trCandidateId.toString(),
      "trbatchId": trbatchId.toString(),
      "trMarks1": trMarks1.toString(),
      "trMarks2": trMarks2.toString(),
      "trMarks3": trMarks3.toString(),
      "trMarks4": trMarks4.toString(),
      "trMarks5": trMarks5.toString(),
      "trMarks6": trMarks6.toString(),
      "trMarks7": trMarks7.toString(),
      "trMarks8": trMarks8.toString(),
      "trMarks9": trMarks9.toString(),
      "trMarks10": trMarks10.toString(),
      "trMarks11": trMarks11.toString(),
      "trMarks12": trMarks12.toString(),
      "trMarks13": trMarks13.toString(),
      "trMarks14": trMarks14.toString(),
      "trMarks15": trMarks15.toString(),
      "trMarks16": trMarks16.toString(),
      "trMarks17": trMarks17.toString(),
      "trMarks18": trMarks18.toString(),
      "trMarks19": trMarks19.toString(),
      "trMarks20": trMarks20.toString(),
      "trTotalMarks": trTotalMarks.toString(),
      "trbatch": trbatch.toString(),
      "tblFinalResult": tblFinalResult.length.toString()
    };
    final response = await http.post('$urlpoint/api/TheoryResult', body: body);
    print(response.body);
    if (response.statusCode == 201) {
      final String responseString = response.body;

      return theoryResultFromJson(responseString);
    } else {
      return throw Exception(response.body);
    }
  }
}
