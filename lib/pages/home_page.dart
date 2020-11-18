/*
 * @Author: your name
 * @Date: 2020-10-22 15:28:11
 * @LastEditTime: 2020-10-30 14:11:47
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /my_app/lib/pages/home_page.dart
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/httpHeaders.dart';
import '../service/service_method.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
             return Column(
                children: <Widget>[
                  SwiperDiy(),
                  // LeaderPhone(leaderPhone:'1321213',leaderImage:'123434')
                  LeaderPhone()
                ],
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
      height: ScreenUtil().setHeight(333),
      width: ScreenUtil().setWidth(750),
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


// 顶部导航
class TopNavigator extends StatelessWidget {
  final List navigatorList;
  TopNavigator({Key key, this.navigatorList}) : super(key: key);

  Widget _gridviewItemUi(BuildContext context,item)  {
    return InkWell(
      onTap:(){},
      child: Column(
        children:<Widget>[
          Image.network(item['image'],width:ScreenUtil().setWidth(95))
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navigatorList.map((e) {
          return _gridviewItemUi(context,e);
        }).toList(),
      ),
    );
  }
}


// 电话模块

class LeaderPhone extends StatelessWidget {
  final String leaderImage;// 店长图片
  final String leaderPhone;// 店长电话
  
  LeaderPhone({Key key, this.leaderPhone,this.leaderImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){},
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: _launchURL,
              child: Text("点击call"),            
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    String url = 'tel:86555010999';
    print("bug");
    if (await canLaunch(url)) {
      await launch(url);
    }else {
      throw 'url不能进行访问';            
    }
  }
}








