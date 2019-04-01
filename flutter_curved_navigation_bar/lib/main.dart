import 'package:flutter/material.dart';
import 'about.dart';
import 'focus.dart';
import 'home.dart';
import 'login.dart';
import 'template.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

  final About about = About();
  final Focus focus = Focus();
  final Home home = Home();
  final Login login = Login();
  final Template template = Template();

  Widget showPage = new Template();

  Widget pageChooser(int page) {
    switch (page) {
      case 0:
        return about;
      break;
      case 1:
        return focus;
      break;
      case 2:
        return home;
      break;
      case 3:
        return login;
      break;
      case 4:
        return template;
      break;
      default:
        return Container(
          child: Text(
            'No page found'
          ),
        );
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          initialIndex: pageIndex,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.red,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              showPage = pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.red,
          child: Center(
            //child: Text(_page.toString(), textScaleFactor: 10.0),
            child: showPage,
          ),
        ));
  }
}