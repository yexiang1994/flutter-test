import 'package:flutter/material.dart';
import './../main/index.dart';
import './../shopping/index.dart';
import './../product/index.dart';
import './../mine/index.dart';
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
      ..add(Shopping())
      ..add(Mine());
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
          backgroundColor: Color.fromRGBO(245,245,245,1),
          iconSize: 15,
          showUnselectedLabels: true,
          // fixedColor: Colors.white,
          selectedItemColor: Color.fromRGBO(254,69,67, 1),
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(IconData(0xe610,fontFamily: "Iconfont" ), size: 22.0,),title: Text("首页")),
            BottomNavigationBarItem(icon: Icon(IconData(0xe630, fontFamily: "Iconfont"), size: 20.0,),title: Text("全部商品")),
            BottomNavigationBarItem(icon: Icon(IconData(0xe608, fontFamily: "IconFont"), size: 22.0,),title: Text("购物车")),
            BottomNavigationBarItem(icon: Icon(IconData(0xe614, fontFamily: "IconFont"), size: 22.0,),title: Text("我的"))
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