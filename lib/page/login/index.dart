import 'package:flutter/material.dart';
import 'package:tests/enum/btnSize.dart';
import './../../commonPage/input/index.dart';
import './../../commonPage/button/defaultBtn.dart';


class Login extends StatelessWidget {

  void doLogin(context){
    Navigator.pushNamed(context, "bottomBar");
    print("登录");
  }
  
  @override
  Widget build(BuildContext context) {
    final widgetWidth = MediaQuery.of(context).size.width;
    final widgetHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/login.jpg"),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.only(top: widgetWidth*2/5, left: 35,right: 35,bottom: 15),
        alignment: FractionalOffset(0.5,1.0),
        child: Column(
            children: <Widget>[
              Container(
                alignment: FractionalOffset.centerLeft,
                padding: EdgeInsets.only(top: 35,bottom: 25),
                child:  Text(
                "登录",
                style: TextStyle(fontSize: 35),
              )),
              ComInput(label: "用户名",value: "", placeholder: "请输入用户名...",),
              ComInput(label: "密码",value: "", placeholder: "请输入密码...",),
              DefaultBtn(text: "登录", onPrss: ()=>doLogin(context),btnSize: BtnSize.large, margin: EdgeInsets.only(top: 80),)
            ],
          ),
      )
    );
  }
}