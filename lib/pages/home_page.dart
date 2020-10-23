/*
 * @Author: your name
 * @Date: 2020-10-22 15:28:11
 * @LastEditTime: 2020-10-23 17:05:20
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /my_app/lib/pages/home_page.dart
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
Dio dioHttp = new Dio();

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body:Center(
        child:Text('商城首页')
      )
    );
  }
}

void getHttp() async {
  try{
    Response response;
    // response = await dioHttp.get("https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=小飞侠");
    response = await dioHttp.get("https://flutterchina.club/networking/");
   return print(response);
    // var 
  }catch(e){
    return print(e);
  }
}