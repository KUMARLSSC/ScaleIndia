import 'dart:convert';
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
}
