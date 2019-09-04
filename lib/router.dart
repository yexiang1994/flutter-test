
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) =>runApp(Routee());

class Routee extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("new router"),
      ),
      body: Center(child: Text("new text")),
    );
  }
}