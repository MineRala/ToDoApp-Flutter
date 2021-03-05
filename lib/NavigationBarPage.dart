import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'ProfilePage.dart';

class NavigationBarPage extends StatefulWidget {
  @override
  _NavigationBarPageState createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {

  int _bottomIndex = 0;

  final List <Widget> _children = [HomePage(), ProfilePage(),];

  void onTapBar(int index){
    setState(() {
      _bottomIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_bottomIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xff885666),
          selectedItemColor: Colors.white,
            onTap: onTapBar,
            currentIndex: _bottomIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text("Home",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile",
                  style: TextStyle(fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ),
            ],
        )
    );
  }
}


