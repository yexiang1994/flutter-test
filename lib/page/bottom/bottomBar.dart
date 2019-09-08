import 'package:flutter/material.dart';
import './../site/index.dart';
import './../maintain/index.dart';
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
      ..add(Site())
      ..add(Maintain());
      super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(color: Colors.white),
        child: Scaffold(
        appBar: AppBar(
          title: Text("主页"),
        ),
        body: list[_index],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.blue,
          iconSize: 15,
          // fixedColor: Colors.white,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.accessibility),title: Text("站点")),
            BottomNavigationBarItem(icon: Icon(Icons.add_alarm),title: Text("维修")),
          ],
          currentIndex: _index,
          onTap: (int i){
            setState(() {
            _index = i; 
            });
          },
        ),
      ));
  }
}