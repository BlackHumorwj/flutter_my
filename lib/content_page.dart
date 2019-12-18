import 'package:flutter/material.dart';
import 'package:flutter_app/demo/demo_state_widget.dart';
import 'package:flutter_app/demo/demo_widget.dart';

class ContentPage extends StatefulWidget {
  CallBack callBack;


  @override
  _ContentPageState createState() => _ContentPageState();
}

abstract class CallBack {
  void callBack(int index);
}

class _ContentPageState extends State<ContentPage> {
  PageController _pageController = new PageController(
      //视图的分数，百分比
      viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //appBar 位置

        Expanded(
            child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            if(widget.callBack!=null){
              widget.callBack.callBack(index);
            }
          },
          children: <Widget>[
            new DemoWidget(null),
            new DemoStateWidget("原值"),
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
