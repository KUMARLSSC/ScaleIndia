import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class FirstPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

   final DialogService _dialogService = locator<DialogService>();

  Future firstpage({@required String requestid ,})async{
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
  }
}
