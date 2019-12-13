import 'package:flutter/material.dart';
class Img extends StatelessWidget {
  ImageProvider image;
  int flex;
  double width;
  double height;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  BoxDecoration decoration;

  Img({this.image, this.flex, this.padding, this.margin,this.decoration, this.height});
  
  Widget imgBox(){
    if(flex != null) {
      return (
        Expanded(
          child: Container(
            padding: padding,
            margin: margin,
            decoration: decoration,
            child: Image(image: image,fit: BoxFit.cover,),
          ),
        )
      );
    }
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      child: Image(image: image, fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imgBox();
  }
}