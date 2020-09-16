import 'package:Scaleindia/Models/route_names.dart';
import 'package:Scaleindia/Services/dialog_service.dart';
import 'package:Scaleindia/Services/navigation_service.dart';
import 'package:Scaleindia/Services/request_service.dart';
import 'package:flutter/foundation.dart';

import '../locator.dart';
import 'base_model.dart';

class FirstPageViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final RequestService _requestService = locator<RequestService>();
  final DialogService _dialogService = locator<DialogService>();
  String i = "1";
  Future firstpage({
    @required String requestid,
  }) async {
    setBusy(true);

    var result = await _requestService.request(requestid);
    setBusy(false);

    if (result is bool) {
      if (result) {
         _navigationService.navigateTo(SecondViewRoute);
      } else {
        await _dialogService.showDialog(
        title: 'Given field is empty ',
        description: 'Please enter your request id',
      );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Request Id error',
        description: 'Please re-enter your request id',
      );
    }
    /* if (requestid == i) {
      _navigationService.navigateTo(SecondViewRoute);
    } else if (requestid.isEmpty) {
      await _dialogService.showDialog(
        title: 'Given field is empty ',
        description: 'Please enter your request id',
      );
    } else {
      await _dialogService.showDialog(
        title: 'Request Id error',
        description: 'Please re-enter your request id',
      );
    }*/
  }

  void navigateToSecondPage() {
    _navigationService.navigateTo(SecondViewRoute);
  }
}
