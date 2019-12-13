import 'package:flutter/material.dart';

//flutter 页面
class DemoPageWidget extends StatefulWidget {
  @override
  _DemoPageWidgetState createState() => _DemoPageWidgetState();
}

class _DemoPageWidgetState extends State<DemoPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //标题栏
        title: Text("appBar"),
      ),
      body: ListView.builder(
        //列表
        itemBuilder: (context, index) {
          return Text("文本");
        },
        itemCount: 20,
      ),
    );
  }
  //api 网络请求
  //modules 数据封装
  //page 页面
  //widgets 自定义组件
  //common 公共组件
}
