
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';



class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '首页'
   ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: '分类'
   ),
       BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      label: '购物车'
   ),
       BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      label: '会员中心'
   ),
  ];

  final List tabBodies = [
    HomePage(),
    CartPage(),
    CategoryPage(),
    MemberPage()
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
   currentPage = tabBodies[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}

/**
 * @description: 静态页面
 * @param {*}
 * @return {*}
 */
// class IndexPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(title: Text("百姓生活+")),
//       body: Center(
//         child: Text("百姓生sfsdaf+")
//       )
//     );
//   }
// }