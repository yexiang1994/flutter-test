import 'package:flutter/material.dart';

void main() =>runApp(EventPage());
// 按下事件
class EventPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("事件"),),
      body: GestDectorWidget(),    
    ),
  );
}

class GestDectorWidget extends StatefulWidget {
  @override
  _GestDectorWidgetState createState() => _GestDectorWidgetState();
}

class _GestDectorWidgetState extends State<GestDectorWidget> {
  double _top=0;
  double _left=0;
  @override
  Widget build(BuildContext context) => Stack(  // 绝对定位
    children: <Widget>[
      Positioned(
        top: _top,
        left: _left,
        child: GestureDetector(
          child: Container(
            color: Colors.red,
            width: 50,
            height: 50,
          ),
          onTap: ()=>print("点击"),
          onDoubleTap: ()=>print("双击"),
          onLongPress: ()=>print("长按"),
          onPanUpdate: (e){  // 拖拽
            setState(() {
             _left+=e.delta.dx;
              _top+=e.delta.dy; 
            });
          },
        ),
      )
    ],
  );
}