// import 'dart:math';
import 'dart:math';
import 'package:flutter/material.dart';
import './page/login/index.dart';
import 'package:flutter/rendering.dart';
import './page/bottom/bottomBar.dart';
import './page/unknowPage/index.dart';
// import './page/bottom/bottomBar2.dart';
void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "fluttter",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        'login': (context) => Login(),
        'bottomBar':(context) => BottomBar()
      },
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(
        builder: (context) => UnKnowPage(),
      ),
      home: Login(),
    );
  }
}

