import 'package:flutter/material.dart';

void main() =>runApp(EventPage());
// 按下事件
class EventPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("事件"),),
      body: Listener(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.red,
        ),
        onPointerDown: (event)=>print("1:$event"),  // 按下
        onPointerMove: (event)=>print("2:$event"),  // 移动
        onPointerUp: (event)=>print("3:$event"),  // 抬起
      ),    
    ),
  );
}