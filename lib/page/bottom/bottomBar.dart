import 'package:flutter/material.dart';
import './../site/index.dart';
class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("主页"),
      ),
      // drawer: ComDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("站点")),
          BottomNavigationBarItem(icon: Icon(Icons.business_center), title: Text("中间")),
        ],
      ),
    );
  }
}