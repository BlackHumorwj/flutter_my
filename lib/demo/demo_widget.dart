import 'package:flutter/material.dart';
//无状态的widget
class DemoWidget extends StatelessWidget {
  String text;

  DemoWidget(this.text); //构造函数赋值

  @override
  Widget build(BuildContext context) {
    return Container(
      //?? 表示 text为空 则返回后面的文本
      child: Center(
        child: Text(
          text ?? "这是无状态的Widget",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
