import 'package:flutter/material.dart';
class Statical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          
          InputChip(
           padding: EdgeInsets.all(10.0),
           label: Text("搜索"),
           
          )
        ],
      ),
    );
  }
}