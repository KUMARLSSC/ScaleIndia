
import 'package:Scaleindia/Pages/EmployerDashBoard/profile_Page.dart';
import 'package:Scaleindia/Pages/EmployerDashBoard/viewJob_page.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'employerHome_page.dart';


class EmployerDashBoardPage extends StatefulWidget {
  @override
  _EmployerDashBoardPageState createState() => _EmployerDashBoardPageState();
}

class _EmployerDashBoardPageState extends State<EmployerDashBoardPage> {
  int pageIndex = 0;

  Widget _showPage = new EmployerHomePage();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return EmployerHomePage();
        break;
      case 1:
        return ViewJobPage();
        break;
      /*case 2:
        return PostJobPage();
        break;*/
      case 2:
        return ProfileEmployerPage();
        break;
    }
    return _pageChooser(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: CurvedNavigationBar(
        height:45.0,
        items: 
      <Widget>[
      Icon(Icons.home, size: 30,color: Colors.white,),
      Icon(Icons.book, size: 30,color: Colors.white,),
      Icon(Icons.account_circle, size: 30,color: Colors.white,),
      ],
      color:kBlack,
      buttonBackgroundColor:kBlackAccent,
      backgroundColor: Colors.white,
      animationCurve: Curves.bounceInOut,
      animationDuration: Duration(milliseconds: 300),
      onTap: (int tappedIndex){
        setState(() {
        _showPage  =_pageChooser(tappedIndex);
        });
      },
      ),
     body: _showPage,    
    );
  }
}