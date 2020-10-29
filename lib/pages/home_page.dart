/*
 * @Author: your name
 * @Date: 2020-10-22 15:28:11
 * @LastEditTime: 2020-10-29 15:03:44
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /my_app/lib/pages/home_page.dart
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../config/httpHeaders.dart';
import '../service/service_method.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
TextEditingController typeController = TextEditingController();
String showtext = '欢迎来到TT大商城';

String homePageContent = "正在获取数据";

@override
  void initState() {
    getHomePageContent().then((value) => {
      setState((){
        homePageContent=value.toString();
      })
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Scaffold(
        appBar: AppBar(title: Text("TT商城"),),

        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                controller:typeController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  labelText: "礼物类型",
                  helperText: "请输入喜欢的类型"
                  ),
                  autofocus: false,
              ),
              RaisedButton(
                onPressed: _btnClick,
                child: Text("选择完毕"),
              ),
              Text(
                showtext,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              )
            ],
            ),
        ),
      )
    );
  }

void _btnClick() {
  print('开始选择');
  if(typeController.text.toString() == "")  {
    showDialog(
      context: context,
      builder: (context) =>AlertDialog(title:Text("不能为空"))
    );
  } else {
    getHttp().then((value) => {
      setState((){
        print(value);
        showtext = value.toString();
      })
    });
  }

}

  Future getHttp() async {
    try{
      // var data = {"name":TypeText},
      Response response;
      Dio dio = new Dio();
      dio.options.headers = httpHeaders;
      response = await dio.get("https://www.baidu.com/");
        // queryParameters: data
      // print(response.data);
      return response.data;
    }catch(e){
      print(e);
    }
  }
}