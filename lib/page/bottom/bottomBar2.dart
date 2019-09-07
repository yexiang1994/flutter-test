import 'package:flutter/material.dart';
import './../site/index.dart';
import './../maintain/index.dart';
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.accessibility),title: Text("站点")),
          BottomNavigationBarItem(icon: Icon(Icons.add_alarm),title: Text("维修")),
        ]
      ),
      // Container(
      //   decoration: BoxDecoration(color: Colors.green),
      //   height: 50,
      //   child: 
        // child: TabBar(
        //   labelStyle: TextStyle(fontSize: 10,height: 0),
        //   tabs: <Widget>[
        //   Tab(
        //     icon: Icon(Icons.ac_unit, size: 18),
        //     text: "站点",
        //   ),
        //   Tab(
        //     icon: Icon(Icons.access_alarm, size: 18),
        //     text: "维修",
        //   )
        // ],),
      // ),
      body: TabBarView(children: <Widget>[
        Site(),
        Maintain()
      ]),
    )
    );
  }
}