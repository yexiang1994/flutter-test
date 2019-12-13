import 'package:flutter/material.dart';
import 'package:tests/commonPage/index.dart';

class Main extends StatelessWidget {
  doBuy() {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: <Widget>[
        Image(
          image: AssetImage('images/login.jpg'),
        ),
        Discount(),
        Div(
          borderRadius: BorderRadius.circular(16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(231, 231, 231, 1), spreadRadius: 2)
              ]),
          margin: EdgeInsets.all(10),
          children: <Widget>[
            Img(image: AssetImage("images/img/back02.jpg")),
            P(
              "鲜炖",
              padding: EdgeInsets.only(bottom: 10),
            ),
            Div(
              row: true,
              children: <Widget>[
                Div(
                  flex: 1,
                  row: true,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("￥111/"),
                    Text(
                      "(180)",
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey),
                    )
                  ],
                ),
                Div(
                  flex: 1,
                  children: <Widget>[
                    FlatButton(
                      onPressed: doBuy,
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("立即购买"),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        Div(
          row: true,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          borderRadius: BorderRadius.circular(10.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          children: <Widget>[
            Div(
              flex: 1,
              children: <Widget>[
                Img(image: AssetImage("images/img/back02.jpg")),
              ],
            ),
            Div(
              flex: 1,
              children: <Widget>[
                P("data")
              ],
            )
          ],
        )
      ]),
    );
  }
}

class Discount extends StatefulWidget {
  @override
  _Discount createState() => _Discount();
}

class _Discount extends State {
  List list;
  void initState() {
    super.initState();
    list = [
      {"src": "images/img/quan.png"},
      {"src": "images/img/quan.png"},
      {"src": "images/img/quan.png"}
    ];
  }

  Widget buildGrid() {
    List<Widget> titls = [];
    Widget content;
    for (int i = 0; i < list.length; i++) {
      if (i > 0) {
        titls.add(Expanded(
            child: Padding(
          padding: EdgeInsets.only(left: 10),
          child: Image(image: AssetImage(list[i]['src'])),
        )));
      } else {
        titls.add(Expanded(
          child: Image(image: AssetImage(list[i]['src'])),
          flex: 1,
        ));
      }
    }
    content = Row(
      children: titls,
    );
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 15),
      child: buildGrid(),
    );
  }
}
