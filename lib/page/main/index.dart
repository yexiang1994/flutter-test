import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './../list/index.dart';
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: ListDio(),
        ),
      ],);
  }
}