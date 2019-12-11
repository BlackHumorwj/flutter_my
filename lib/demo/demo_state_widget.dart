import 'package:flutter/material.dart';
import 'package:flutter_app/demo/demo_page_widget.dart';

class DemoStateWidget extends StatefulWidget {
  String text;

  //构造方法传值
  DemoStateWidget(this.text);

  @override
  _DemoStateWidgetState createState() => _DemoStateWidgetState(text);
}

class _DemoStateWidgetState extends State<DemoStateWidget> {
  String text;

  _DemoStateWidgetState(String text);

//初始化回调
  @override
  void initState() {
    super.initState();
    new Future.delayed(Duration(seconds: 10), () {
      setState(() {
        text = "这就是变化的值";
      });
    });
  }

  //initSate 之后调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  //销毁回调
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //容器布局
      margin: EdgeInsets.all(10),
      //边距
      height: 50,
      //
      width: 50,
      decoration: BoxDecoration(
          //盒式装饰器
          borderRadius: BorderRadius.all(Radius.circular(5)), //圆角
          color: Colors.blue[100], //填充色
          border: Border.all(color: Colors.red, width: 0.3)),
      //边宽颜色和宽度

      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center, //x轴 居中
            crossAxisAlignment: CrossAxisAlignment.center, //y轴 居左
            //左右结构
            children: <Widget>[
              Expanded(
                //铺满剩下空间，默认flex为1。flex 绝对占比
                child: Text(
                  "Column",
                ),
                flex: 2, //flex 绝对占比
              ),
              Expanded(
                child: Text(text ?? ""),
                flex: 4,
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              getBottomWidget(Icons.person, "点赞"),
              getBottomWidget(Icons.explore, "你好"),
              getBottomWidget(Icons.person, "点赞")
            ],
          ),
          getItemWidget(),
        ],
      ),
    );
  }

  getBottomWidget(IconData iconData, String text) {
    return Expanded(
        child: new Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //横轴居中
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center, //竖轴居中
        children: <Widget>[
          Icon(
            iconData,
            size: 15,
          ),
          Padding(padding: EdgeInsets.only(left: 10)),
          Text(
            text,
            style: TextStyle(fontSize: 15, color: Colors.black),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        ],
      ),
    ));
  }

  getItemWidget() {
    return Container(
//      margin: EdgeInsets.all(10),
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.all(Radius.circular(10)),
//          color: Colors.white),
      child: Card(
        //默认卡片效果

        child: FlatButton(
          onPressed: () {
            print("点击了");
            Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
              return new DemoPageWidget();
            }));
          },
          child: Padding(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "这是点貌似",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    getBottomWidget(Icons.person, "点赞"),
                    getBottomWidget(Icons.share, "分享"),
                    getBottomWidget(Icons.call_made, "点击")
                  ],
                ),
                RichText(
                  text: TextSpan(),
                ),
                TextField()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
