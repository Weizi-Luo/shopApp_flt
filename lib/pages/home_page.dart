/*
 * @Author: your name
 * @Date: 2020-10-22 15:28:11
 * @LastEditTime: 2020-10-29 16:38:55
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /my_app/lib/pages/home_page.dart
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../config/httpHeaders.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

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

        body: FutureBuilder(
          future: getHomePageContent(),
          builder: (context,snapshot) {
            if(snapshot.hasData) {
              var data = json.decode(snapshot.data.toString());
              List<Map> swiper = (data['data']['slides'] as List).cast();
              return Column(
                children: <Widget>[
                  SwiperDiy()
                ],
              );
            }else {
              return Center(
                child:       SwiperDiy()
              );
            }
          },

        ),
      )
    );
  }
}


// 首页轮播组件
class SwiperDiy extends StatelessWidget {

  // final List swiperDateList;
  // SwiperDiy({this.swiperDateList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 333,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: new SwiperPagination(),
        control: new SwiperControl(),

        // itemBuilder: (BuildContext context, int index){
        //   return Image.network("${swiperDateList[index]['image']}");
        // },
        // itemCount: swiperDateList.length,
        // pagination: SwiperPagination(),
        // autoplay: true,
      ),
    );
  }
}