import 'package:dreamy_project/pages/home_page.dart';
import 'package:dreamy_project/pages/notification_page.dart';
import 'package:dreamy_project/pages/sleep_page.dart';
import 'package:dreamy_project/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavBar extends StatefulWidget{
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
  List Pages = [
    HomePage(),
    SleepPage(),
    NotificationPage(),
    UserPage()
  ];

  int _selectedIndex = 0;

  @override
  Widget build (BuildContext context){
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromRGBO(57, 34, 99, 1), Color.fromRGBO(153, 85, 196, 1)],
            ),
            boxShadow: [BoxShadow(
                color: Colors.black,
                spreadRadius: 1,
                blurRadius: 10
            )]
        ),
        child: CurvedNavigationBar(
          index: _selectedIndex,
          color: Colors.black,
          backgroundColor: Colors.transparent,

          animationCurve: Curves.easeInOutCubicEmphasized,
          height: 50,
          buttonBackgroundColor: Colors.transparent,
          items: [
            Icon(Icons.home_filled, color: Colors.white),
            Icon(Icons.nightlight_rounded,color: Colors.white,),
            Icon(Icons.notifications, color: Colors.white,),
            Icon(Icons.person, color: Colors.white,)
          ],
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      body: Pages[_selectedIndex],
    );
  }
}
