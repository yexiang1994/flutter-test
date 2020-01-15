import 'package:flutter/material.dart';
import 'dart:io';
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
  @override 
  void initState() {
    super.initState();
    getUdp();
  }
  getUdp() async{
    var receiver =  await UDP.bind(Endpoint.loopback(port: Port(10001)));
    await receiver.listen((data){
      var ste = String.fromCharCodes(data.data);
      print(ste);
      // Stdout.write(ste);
    }, timeout:  Duration(seconds: 1000));
  }
  @override
  Widget build(BuildContext context){
    return Text("aa");
  }
}
