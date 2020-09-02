import 'package:flutter/material.dart';


AppBar header(context,{bool isAppTitle,bool isIcon,String strTitle, Widget icon,disappearedBackButton=false}){
  return AppBar(
  
    automaticallyImplyLeading: disappearedBackButton ? false:true,
    title: Text(
      isAppTitle ? "Scale India" : strTitle,
      style: TextStyle(
        color: Colors.white,
        fontSize: isAppTitle ? 25.0:25.0,
      ),
      overflow: TextOverflow.ellipsis,
    ),
    
    centerTitle: true,
    flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.blue[900],
            Colors.blue[800],
            Colors.blue[400]
                ],
              ),
            ),
          ),
  );
}