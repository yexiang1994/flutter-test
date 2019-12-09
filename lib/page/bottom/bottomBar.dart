import 'package:flutter/material.dart';
import './../main/index.dart';
import './../shopping/index.dart';
import './../product/index.dart';
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
      ..add(Main())
      ..add(Product())
      ..add(Shopping());
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
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(IconData(0xe610,fontFamily: "Iconfont" )),title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(IconData(0xe630, fontFamily: "Iconfont")),title: Text("全部商品")),
            BottomNavigationBarItem(icon: Icon(IconData(0xe608, fontFamily: "IconFont")),title: Text("购物车"))
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