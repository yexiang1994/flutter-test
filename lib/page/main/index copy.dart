import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  doBuy(){

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: <Widget>[
        Image(
          image: AssetImage('images/login.jpg'),
        ),
        Discount(),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/img/back02.jpg"),
              ),
              Text("燕窝"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(child: 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("1"),
                        Text("data", style: TextStyle(decoration: TextDecoration.lineThrough),)
                      ],
                    ),
                    flex: 1,
                  ),
                  Expanded(child: 
                    FlatButton(
                      onPressed: doBuy,
                      color: Colors.red,
                      textColor: Colors.white,
                      child: Text("立即购买"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      ),
                    ),
                  flex: 1,
                  )
                ],
              ),
            ],
          ),
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
    // for (var item in list) {
    //   titls.add(Expanded(
    //     child: Image(image: AssetImage(item['src'])),
    //     flex: 1,
    //   ));
    // }
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
