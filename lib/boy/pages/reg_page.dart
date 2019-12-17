import 'package:flutter/material.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "注册",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              GestureDetector(
                child: ClipRRect(
                  //头像
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset(
                    "assets/test.jpeg",
                    fit: BoxFit.fill,
                    height: 60,
                    width: 60,
                  ),
                ),
                onTap: () {},
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "您好",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  "欢迎来到注册页面",
                  style: TextStyle(fontSize: 15, color: Colors.black38),
                ),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "请输入11位手机号"),
              ),
              TextField(
                decoration: InputDecoration(hintText: "请输入您的昵称"),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: "请输入6位密码"),
              ),
              Container(
                width: 180,
                height: 44,
                margin: EdgeInsets.only(top: 40),
                child: MaterialButton(
                  //设置圆角
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  color: Colors.blue,
                  child: Text(
                    '注册',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
