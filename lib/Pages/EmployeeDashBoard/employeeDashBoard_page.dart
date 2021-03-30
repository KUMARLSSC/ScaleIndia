import 'package:Scaleindia/Pages/EmployeeDashBoard/findjob_page.dart';
import 'package:Scaleindia/Pages/EmployeeDashBoard/profile_Page.dart';
import 'package:Scaleindia/shared/shared_styles.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class EmployeeDashBoardPage extends StatefulWidget {
  @override
  _EmployeeDashBoardPageState createState() => _EmployeeDashBoardPageState();
}

class _EmployeeDashBoardPageState extends State<EmployeeDashBoardPage> {
  int pageIndex = 0;

  Widget _showPage = new FindJobPage();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return FindJobPage();
        break;
      case 1:
        return ProfilePage();
        break;
    }
    return _pageChooser(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 45.0,
        items: <Widget>[
          Icon(
            Icons.book,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_circle,
            size: 30,
            color: Colors.white,
          ),
        ],
        color: kBlack,
        buttonBackgroundColor: kBlackAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: _showPage,
    );
  }
}
