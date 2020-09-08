import 'dart:convert';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/json_api.dart';
import 'package:http/http.dart' as http;

import '../locator.dart';
import 'base_model.dart';

class FirstPageViewModel extends BaseModel {
  // ignore: unused_field
  final NavigationService _navigationService = locator<NavigationService>();

  // ignore: unused_field
  final DialogService _dialogService = locator<DialogService>();
  String assessrName = '';
  String center = '';
  String batchNo = 0;
  String url = 'http://www.json-generator.com/api/json/get/cgtsezzKKW?indent=2';

  Future getData(String id) async {
    String profile = url + id;
    var response =
        await http.get(profile, headers: {"Accept": "application/json"});
     var resBody = json.decode(response.body);
     assessrName = resBody['assessrName'];
    batchNo = resBody['batchNo'];
    center = resBody['center'];
  }

  /*Future firstpage({@required String requestid ,})async{
     if (requestid.isEmpty){
         await _dialogService.showDialog(
          title: 'Given field is empty ',
          description: 'Please enter your request id',
        );
     }else{
       _navigationService.navigateTo(SecondViewRoute);
     }
  }

  void navigateToSecondPage() {
    _navigationService.navigateTo(SecondViewRoute);
  }*/
}
