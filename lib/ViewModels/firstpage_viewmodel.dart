import 'package:Scaleindia/Models/route_names.dart';
//import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
//import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class FirstPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  // final DialogService _dialogService = locator<DialogService>();

   //Future firstpage({@required String number,})async{
//     if (){

//     }else{

  //   }
   //}

  void navigateToSecondPage() {
    _navigationService.navigateTo(SecondViewRoute);
  }
}
