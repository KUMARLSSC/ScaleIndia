import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:flutter/material.dart';

AppBar header(context,
    {bool isAppTitle,
    bool isIcon,
    String strTitle,
    Widget icon,
    disappearedBackButton = false,
    List<Widget> action,
    centerTitle = true}) {
  return AppBar(
    automaticallyImplyLeading: disappearedBackButton ? false : true,
    leading: icon,
    title: Text(
      isAppTitle ? "Scale India" : strTitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: isAppTitle ? 25.0 : 25.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    centerTitle: centerTitle ? true : false,
    actions: action,
    flexibleSpace: Container(
      decoration: BoxDecoration(color: kBlack),
    ),
  );
}
