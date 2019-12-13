import 'package:flutter/material.dart';
import './display.dart';
class P extends StatelessWidget{
  int flex;
  Display display;
  String data;
  TextStyle style;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  Color background;
  BoxBorder border;
  P(this.data, {this.flex, this.display, this.style, this.padding, this.margin, this.background});

  Widget center(){
    return Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: background,
          border: border
        ),
        child: Text(
          data,
          style: style,
        ),
      );
  }

  Widget content(){
    // 行元素
    if(display == Display.flex){
      return Expanded(
        flex: flex,
        child: center(),
      );
    } else {
      return center();
    }
  }

  @override 
  Widget build(BuildContext context){
    return content();
  }
}