import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'LoginPage.dart';
import 'NavigationBarPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        routes: {
        "/" :(context) => LoginPage(),
        "/navigationBarPage" : (context) =>NavigationBarPage(),
        "/homePage" : (context) => HomePage(),
        },
    );
  }
}


