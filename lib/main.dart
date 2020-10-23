/*
 * @Author: your name
 * @Date: 2020-10-22 10:21:06
 * @LastEditTime: 2020-10-23 11:48:36
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /my_app/lib/main.dart
 */
import 'package:flutter/material.dart';
import './pages/index_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "百姓生活+",
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}
