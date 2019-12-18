import 'package:flutter/material.dart';
import 'package:flutter_app/boy/pages/login_page.dart';
import 'package:flutter_app/boy/pages/reg_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  var curIndex = 0;

  TabController controller;
  IndexedStack bodyStack;

  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 2);
    controller.addListener(() {
      setState(() {
        curIndex = controller.index;
      });
    });

    bodyStack = new IndexedStack(
      children:  [new LoginPage(), new RegPage()],
      index: curIndex,
      alignment: Alignment.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xxxxx"),
      ),
      body: bodyStack,
//      body: TabBarView(
//          physics: NeverScrollableScrollPhysics(),
//          controller: controller,
//          children: [
//            LoginPage(),
//            RegPage(),
//          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          getBottomNavigationBarItem("首页", Icons.share),
          getBottomNavigationBarItem("我的", Icons.phone),
        ],
        currentIndex: curIndex,
        onTap: (index) {
          setState(() {
            controller.index = index;
            curIndex = index;
          });
        },
      ),
    );
  }

  getBottomNavigationBarItem(String title, IconData iconData) {
    return BottomNavigationBarItem(
      title: Text(title),
      icon: Icon(iconData),
    );
  }
}
