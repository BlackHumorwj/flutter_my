import 'package:flutter/material.dart';

class ContentPage extends StatefulWidget {
  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  PageController _pageController = new PageController(
      //视图的分数，百分比
      viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar 位置

        Expanded(
            child: PageView(
          controller: _pageController,
          children: <Widget>[
            getPageContent(0),
            getPageContent(1),
            getPageContent(2),
            getPageContent(3),
          ],
        ))
      ],
    );
  }

  getPageContent(int index) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ));
  }
}
