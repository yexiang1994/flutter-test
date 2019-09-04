import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../enum/btnSize.dart';
class DefaultBtn extends StatelessWidget{
  
  Function onPrss;
  String text;
  BtnSize btnSize;
  EdgeInsetsGeometry margin;

  DefaultBtn({this.onPrss, this.text, this.btnSize, this.margin});
  
  @override
  Widget build(BuildContext context){
    double height =35.0;
    switch (btnSize) {
      case BtnSize.small:
        height = 35.0;
        break;
      case BtnSize.large:
        height = 45.0;
        break;
      case BtnSize.big:
        height= 55.0;
        break;
      default:
        height= 35.0;
        break;
    }
    return Container(
      margin: margin,
      height: height,
      width: double.infinity,
      child: FlatButton(
        child: Text(text),
          onPressed: onPrss,
          textColor: Colors.white,
          color: Colors.blue[400],
      ),
    );
  }
}