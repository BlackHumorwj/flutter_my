import 'package:flutter/material.dart';
import 'package:flutter_app/content_page.dart';
//底部导航框架搭设
class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  final Color _defaultColor = Colors.grey;
  final Color _activeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    //Scaffold 底部导航 顶部导航 侧边导航
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            //渐变设置
            gradient: LinearGradient(
                colors: [Color(0xffedeef0), Color(0xffe6e7e9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ContentPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //title 一直存在
        currentIndex: _currentIndex,
        items: [
          _bottomItem("本周", Icons.folder, 0),
          _bottomItem("分享", Icons.explore, 1),
          _bottomItem("免费", Icons.donut_small, 2),
          _bottomItem("长安", Icons.person, 3),
        ],
        onTap: onTabTapped,
      ),
    );
  }

  //封装底部tab
  _bottomItem(String title, IconData iconData, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          iconData,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          iconData,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(
              color: _currentIndex == index ? _activeColor : _defaultColor),
        ));
  }

  void onTabTapped(int index) {
    //修改页面状态 ，会重新调用build()方法
    setState(() {
      _currentIndex = index;
    });
  }
}
