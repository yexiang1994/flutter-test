// import 'dart:math';
import 'package:flutter/material.dart';
import './page/login/index.dart';
import './page/bottom/bottomBar.dart';
//import './page/test/dialog.dart';
void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "fluttter1",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        'login': (context) => Login(),
        'bottomBar':(context) => BottomBar()
      },
      home: Login(),
    );
  }
}

