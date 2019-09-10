import 'package:flutter/material.dart';

void main() =>runApp(EventPage());
// 按下事件
class EventPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("事件"),),
      body: MyNotification(),    
    ),
  );
}


class ConContain extends InheritedWidget{
  // 用于 子组件 在 组件树 中找到他需要的那个组件
  static ConContain of(BuildContext context)=>context.inheritFromWidgetOfExactType(ConContain);
  
  final _MyCountState model;
  final Function increment;

  ConContain({
    Key key,
    @required this.model,
    @required this.increment,
    @required Widget child,
  }):super(key: key, child: child);

  // 判断是否需要更新
  @override
  bool updateShouldNotify(ConContain oldWidget){
     return model !=oldWidget.model;
  }
}

class MyCount extends StatefulWidget {
  @override
  _MyCountState createState() => _MyCountState();
}

class _MyCountState extends State<MyCount> {
  int count = 0;
  void _increment(){
    setState(() {
     count ++; 
    });
  }
  @override
  Widget build(BuildContext context) => ConContain(
    model: this,
    increment:_increment,
    child: Counter()
  );
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 先获取 inheritedWidget 子节点
    ConContain state = ConContain.of(context);
    return Scaffold(
      appBar: AppBar(title: Text("data"),),
      body: Text("已经被点击${state.model.count}"),
      floatingActionButton: FloatingActionButton(
        onPressed: state.increment,
      ),
    );
  }
}

// 分发通知
class CustomNotification extends  Notification{
  final String msg;
  CustomNotification(this.msg);
}
class Sends extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>RaisedButton(
    onPressed: ()=>CustomNotification("aaa").dispatch(context),
  );
}

class MyNotification extends StatefulWidget {
  @override
  _MyNotificationState createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  String _msg = "通知";
  @override
  Widget build(BuildContext context) => NotificationListener<CustomNotification>(
    onNotification: (Notification){
      setState(() {
        _msg += Notification.msg + "---"; 
      });
    },
    child: Column(children: <Widget>[
       Text(_msg),
      Sends()
    ],)
  );
}