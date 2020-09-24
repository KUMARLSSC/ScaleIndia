import 'dart:convert';
import 'package:Scaleindia/ApiModel/candidate_api.dart';
import 'package:Scaleindia/ApiModel/center_api.dart';
import 'package:http/http.dart' as http;

class Api {
  static const theorypoint =
      'https://webapplication320200218110357.azurewebsites.net';
  var client = new http.Client();

  Future<CenterAssesor> getCenterAssesor(int resId) async {
    var response =
        await client.get('$theorypoint/api/CenterAssesorInfo/$resId');
    final jsonresponse = json.decode(response.body);

    return CenterAssesor.fromJson(jsonresponse);
  }

  Future<List<Candidate>> getCandidateLiST(int resId) async {
    var _candidate = List<Candidate>();
    // Get user posts for id
    var response =
        await client.get('$theorypoint/api/CandidateList/$resId');

    // parse into List
    var parsed = json.decode(response.body)  as List<dynamic>;

    // loop and convert each item to Post
    for (var candidate in parsed) {
      _candidate.add(Candidate.fromJson(candidate));
    }

    return _candidate;
  }
}
