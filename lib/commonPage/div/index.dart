import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Div extends StatelessWidget {
  List<Widget> children;
  EdgeInsetsGeometry padding;
  EdgeInsetsGeometry margin;
  double width;
  double height;
  int flex;
  Color background;
  GestureTapCallback onTap;
  GestureTapCallback onDoubleTap;
  BoxDecoration decoration;
  BorderRadiusGeometry borderRadius;
  bool row;
  MainAxisAlignment mainAxisAlignment;
  MainAxisSize mainAxisSize;
  CrossAxisAlignment crossAxisAlignment;
  TextDirection textDirection;
  VerticalDirection verticalDirection;
  TextBaseline textBaseline;

  Div(
      {this.children,
      this.padding,
      this.margin,
      this.width,
      this.height,
      this.flex,
      background,
      this.onTap,
      this.onDoubleTap,
      this.decoration,
      this.row = false,
      this.borderRadius,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.mainAxisSize = MainAxisSize.max,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.textDirection,
      this.verticalDirection = VerticalDirection.down,
      this.textBaseline});

  Widget isRow() {
    if (row) {
      return Row(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline);
    } else {
      return Column(
          children: children,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          crossAxisAlignment: crossAxisAlignment,
          textDirection: textDirection,
          verticalDirection: verticalDirection,
          textBaseline: textBaseline);
    }
  }

  // MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  // MainAxisSize mainAxisSize = MainAxisSize.max,
  // CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  // TextDirection textDirection,
  // VerticalDirection verticalDirection = VerticalDirection.down,
  // TextBaseline textBaseline,
  Widget content() {
    return Container(
        padding: padding,
        margin: margin,
        width: width,
        height: width,
        color: background,
        decoration: decoration,
        child: ClipRRect(
          child: isRow(),
          borderRadius: borderRadius,
        ));
  }

  Widget center() {
    if (borderRadius != null) {
      return Container(
          padding: padding,
          margin: margin,
          width: width,
          height: width,
          color: background,
          decoration: decoration,
          child: ClipRRect(
            child: isRow(),
            borderRadius: borderRadius,
          ));
    }
    return Container(
        padding: padding,
        margin: margin,
        width: width,
        height: width,
        color: background,
        decoration: decoration,
        child: isRow());
  }

  Widget onTapCenter() {
    return InkWell(child: center(), onTap: onTap, onDoubleTap: onDoubleTap);
  }

  Widget box() {
    if (onTap != null && onDoubleTap != null) {
      return center();
    }
    return onTapCenter();
  }

  @override
  Widget build(BuildContext context) {
    if (width != null) {
      return box();
    } else {
      return Expanded(flex: flex, child: box());
    }
  }
}
