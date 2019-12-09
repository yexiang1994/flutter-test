import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
Dio dio = Dio();
class ListDio extends StatefulWidget {
  @override
  _ListDioState createState() => _ListDioState();
}

class _ListDioState extends State<ListDio> with AutomaticKeepAliveClientMixin{
  var data = [];
  var dd = 0;
  @override
  void initState() {
    super.initState();
    getMovies();
  }
  @override 
  bool get wantKeepAlive=>true; // 保持界面状态
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(children: <Widget>[
        IconButton(icon: Icon(Icons.list),onPressed: getMovies,),
        Expanded(
          flex: 1,
          child: ListView.builder(
            itemCount: data.length,
            // shrinkWrap: true,
            itemBuilder: (BuildContext crx,int i){
              var list = data[i];
              return Row(children: <Widget>[
                Image.network(data[1]["images"]["small"], height: 180,width: 130,),
                Text(list["title"], style: TextStyle(height: 1.5,fontSize: 15),)
              ],); 
            },
          ),
        )
      ],) 
    );
  }
  getMovies () async{ 
     
  }
}