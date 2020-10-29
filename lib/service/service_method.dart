/*
 * @Author: your name
 * @Date: 2020-10-29 14:26:15
 * @LastEditTime: 2020-10-29 15:01:13
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /my_app/lib/service/service_method.dart
 */
import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

// 获取首页主题内容

Future getHomePageContent() async {

  try{
    print("开始获取数据");
    Response response;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded") as String;
    var formData = {'lon':'123','lat':'13.23'};
    response = await dio.post(servicePath["homePageContent"],data: formData);
    if (response.statusCode == 200) {
      return response.data;
    }else {
       throw Exception('后端接口出现异常');
    }

  }catch(e) {
    print(e);
  }

}