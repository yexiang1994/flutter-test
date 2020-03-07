// import 'dart:math';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import './page/login/index.dart';
import 'package:flutter/rendering.dart';
import './page/bottom/bottomBar.dart';
import './page/unknowPage/index.dart';
import './page/test/udptest.dart';
// import './page/bottom/bottomBar2.dart';
void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
  getPermiss();

}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "fluttter",
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        'test': (context) => UdpTest(),
        'login': (context) => Login(),
        'bottomBar':(context) => BottomBar()
      },
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(
        builder: (context) => UnKnowPage(),
      ),
      home: UdpTest(),
    );
  }
}

getPermiss() async{
  Map<PermissionGroup, PermissionStatus> permissions = 
    await PermissionHandler().requestPermissions([PermissionGroup.storage]);
    
  PermissionStatus permission = 
    await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  if(permission == PermissionStatus.granted) {
    print("申请成功");
  } else {
    print("申请失败");
    // bool isShow = await PermissionHandler()
    // .shouldShowRequestPermissionRationale(PermissionGroup.storage);
  }
}
