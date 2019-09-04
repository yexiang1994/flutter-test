// import 'dart:math';
import 'dart:math';
import 'package:flutter/material.dart';
import './page/login/index.dart';
import 'package:flutter/rendering.dart';
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
        'login': (context) => Login()
      },
      home: Login(),
    );
  }
}

