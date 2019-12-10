import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  @override
  _DialogState createState()=> _DialogState();
  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Flex(children: <Widget>[
  //       Text("弹框界面"),
  //       dalog()
  //     ],),
  //   );
  // }
}
class _DialogState extends State<DialogDemo> {
  @override 
  void initState(){
  }
 
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: new BoxDecoration(
        color:Colors.white
      ),
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
        FlatButton(
          child: Text("按钮"),
          textColor: Colors.red,
          onPressed: (){
              simpleDialog(context);
            },
        )
      ],),
    );
  }

  // @override
  // Widget build(BuildContext context){
  //   return Container(
  //     child: FlatButton(
  //         child: Text("按钮"),
  //         textColor: Colors.red,
  //         onPressed: (){
  //             simpleDialog(context);
  //           },
  //       )
  //   );
  // }
}
void dalog(BuildContext context){
  showDialog<void>(
    context: context,
    barrierDismissible:false,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("测试"),
        content: SingleChildScrollView(
          child: ListBody(children: <Widget>[
            Text("中间内容"),
            Text("中间内容1")
          ],),
        ),
        actions: <Widget>[
          FlatButton(
              child: Text("actions"),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
        ],
      );
    }
  );
}

enum Department{
  one,
  two,
  three
}

Future<void> simpleDialog(BuildContext context) async{
    switch(await showDialog<Department>(
      context: context, 
      builder: (BuildContext context){
        return SimpleDialog(
            title: Text("simpletitle"),
            children: <Widget>[
              SimpleDialogOption(
                  onPressed: (){
                    Navigator.pop(context, Department.one);
                  },
                  child: Text("one"),
              ),
              SimpleDialogOption(
                  onPressed: (){
                    Navigator.pop(context, Department.two);
                  },
                  child: Text("two"),
              ),
              SimpleDialogOption(
                  onPressed: (){
                    Navigator.pop(context, Department.three);
                  },
                  child: Text("three"),
              )
            ],
          );
      }
    )) {
      case Department.one:
        print("第一种情况");
        break;
      case Department.two:
        print("第二种情况");
        break;
      case Department.three:
        print("第三种情况");
        break;
    }
}