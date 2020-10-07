import 'package:Scaleindia/Pages/EmployeeDashBoard/profile_Page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'elearning_page.dart';
import 'findjob_page.dart';
import 'home_Page.dart';

class EmployeeDashBoardPage extends StatefulWidget {
  @override
  _EmployeeDashBoardPageState createState() => _EmployeeDashBoardPageState();
}

class _EmployeeDashBoardPageState extends State<EmployeeDashBoardPage> {
  int pageIndex = 0;

  Widget _showPage = new HomePage();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return HomePage();
        break;
      case 1:
        return EmployeeElearningPage();
        break;
      case 2:
        return FindJobPage();
        break;
      case 3:
        return ProfilePage();
        break;
    }
    return _pageChooser(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height:45.0,
        items: 
      <Widget>[
      Icon(Icons.home, size: 30,color: Colors.white,),
      Icon(Icons.book, size: 30,color: Colors.white,),
      Icon(Icons.add, size: 30,color: Colors.white,),
      Icon(Icons.account_circle, size: 30,color: Colors.white,),
      ],
      color:Colors.blue,
      buttonBackgroundColor:Colors.blue,
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