import 'package:flutter/material.dart';
import './../map/index.dart';
import './../statical/index.dart';
import './../mine/index.dart';
import './../scan/index.dart';
import './../inform/index.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _index=0;
  List<Widget> list = new List<Widget>();
  @override
  void initState(){
    list
      ..add(Statical())
      ..add(MapPage())
      ..add(Scan())
      ..add(Inform())
      ..add(Mine());
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(color: Colors.blue),
      child: Container(
        padding: EdgeInsets.only(top:40),
        child: Scaffold(
        body: list[_index],
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 15,
          unselectedItemColor: Colors.black87,
          fixedColor: Colors.blue,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.satellite),title: Text("站点")),
            BottomNavigationBarItem(icon: Icon(Icons.control_point),title: Text("地图")),
            BottomNavigationBarItem(icon: Icon(IconData(
              0xe859, fontFamily: 'Iconfont'
            ), color: Colors.red,),title: Text("扫码")),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_none),title: Text("通知")),
            BottomNavigationBarItem(icon: Icon(Icons.perm_identity),title: Text("我的"))
          ],
          currentIndex: _index,
          onTap: (int i) {
            setState(() {
            _index = i; 
            });
          },
        ),
      )));
  }
}