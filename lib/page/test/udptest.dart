import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

import 'package:tests/jsonData/ListParams.dart';
import 'package:udp/udp.dart';
class UdpTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: QueryUdp()
    );
  }
}

class QueryUdp extends StatefulWidget{
  @override
  _QueryUdp createState()=> _QueryUdp();
}
class _QueryUdp extends State{
  void data;
  Stream<List<int>> streamData;
  @override 
  void initState() {
    super.initState();
    getUdp();
  }
  String dataRow = "";
  String localPath = "";
  getUdp() async{
    // var receiver = await UDP.bind(Endpoint.any(port: Port(10001)));
    // await receiver.listen((rs) {
    //   var data = utf8.decode(rs.data);
    //   var objdata = json.decode(data);
    //   String uuid = objdata["uuid"];
    //   print("data:------- "+ objdata["uuid"]);
    //   var ip = rs.address.address;
    //   saveTcp(ip, uuid);
    // });
    // return;
    // saveTcp("10.168.3.133", "");


    _getBattery();
  }
  var first = true;
  var size = 0;
  // ByteBuffer dataRow;
  // List<int> dataRow;
  
  int fileSize = 0;
  saveTcp(String ip, String uuid) async{
    //连接服务器的4041端口
    var socket = await Socket.connect(ip, 10000);
    var pm = ListParams(fileName: "cp.json", type: "download"); 
    socket.add(utf8.encode(pm.toString()));
    socket.listen((data) {
      if(first) {
         first = false;
          // print("接收到来自Server的数据：" + utf8.decode(data));
          var datas = json.decode(utf8.decode(data));
          if(datas["code"] == 0) {
          var filePm = ListParams(fileName: "", type: "isReceive");
          var filedata = filePm.toString();

          size = datas["fileSize"];
          socket.add(utf8.encode(filedata));
       }
      } else {
          // print("****************"+data.length.toString() + " size: " + size.toString() + " dataRow:" + dataRow.length.toString());
          dataRow =  dataRow + utf8.decode(data);
          fileSize += data.length;
          if(fileSize >= size) {
            stogeData(dataRow);
          }
      }
      // var filePm = ListParams(fileName: datas["fileMd5"], type: "download");
      // socket.add(utf8.encode(filePm.toString()));
      // print("接受到的第二次数据：" + utf8.decode(data));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text("aa");
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,1020}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

 Future<File> _getLocalFile() async {
    // List<Directory> dir = await getExternalStorageDirectories();
    // dir.forEach((val){
    //   print(val.path);
    // });
    var paths = await getExternalStorageDirectory();
    var pathstr = paths.path;

    // print(pathstr);
    // return new File("/storage/emulated/countter.txt");
    // return new File("/data/user/0/com.example.tests/app_flutter/countter.txt");
    // localPath = dir;

    // new Directory('$pathstr/comapps').create().then((rs)=>{
    //   print("rs:" + rs.path)
    // });

    
    // print(getpath);
    return new File('$pathstr/comapps/counterxxxs.txt');
    // return new File('$dir/counterxxxs.txt');
  }
  Future<Null> stogeData(String counter) async {
    // await _getLocalFile();
    await (await _getLocalFile()).writeAsString("3333333333333333333");
    // await (await _getLocalFile()).writeAsString('$counter');
  }


  Future<Null> _getBattery() async{
    String CHANNEL ="com.test.plugin";
    String INSTALL = "install";

    // MethodChannel(CHANNEL).setMethodCallHandler((handle)=>Future<String>((){
    //   print("handle:  $handle");
    // }));
    MethodChannel(CHANNEL).invokeMethod("path", "xx").then((rs) async{
      print("返回的路径: $rs" );
      var path = rs + "/flutterTest";
      new Directory(path).create().then((val){
        new File(path + "/tttt.xx");
      });
    });
  }
}
