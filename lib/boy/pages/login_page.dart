import 'package:flutter/material.dart';
import 'package:flutter_app/boy/api/Api.dart';
import 'package:flutter_app/boy/api/NetUtils.dart';
import 'package:flutter_app/boy/common/DialogUtils.dart';
import 'dart:convert';
//登录页面
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _accountEditingController = TextEditingController();
  TextEditingController _pswEditingController = TextEditingController();
  String _account_text;
  String _psw_text;

  @override
  void initState() {
    super.initState();

    initEvent();
  }

  void initEvent() {
    _accountEditingController.addListener(() {
      _pswEditingController.text = _accountEditingController.text;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "登录",
        ),
        leading: IconButton(
            icon: BackButtonIcon(),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          children: <Widget>[
            Align(
              //对齐控件
              alignment: Alignment.center,
              child: Text(
                "您好！",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "欢迎来到登录页面",
                style: TextStyle(fontSize: 13),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _accountEditingController, //设置输入框的监听
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "请输入11位手机号"),
                //TextField变化的监听
                onChanged: (value) {
//                  _pswEditingController.text = value;
//                  setState(() {});
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _pswEditingController, //设置输入框的监听
                //密码的形式*显示
                obscureText: true,
                decoration: InputDecoration(hintText: "请输入6位密码"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: GestureDetector(
                //给widget设置点击事件
                onTap: () {
                  DialogUtils.show(context, "ddd", "ddd");
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "没有账号注册一个吧~",
                    style: TextStyle(
                        decoration: TextDecoration.underline, //下划线
                        color: Colors.black38),
                  ),
                ),
              ),
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
                  '登录',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _account_text = _accountEditingController.text;
                  _psw_text = _pswEditingController.text;

                  _login(_account_text, _psw_text);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Map<String, String> _map = new Map();

  void _login(String account, String psw) {
    if (account.isEmpty || psw.isEmpty) {
      DialogUtils.show(context, "提示", "账号密码不能为空");
      return;
    }
    _map.clear();
    _map["loginName"] = account;
    _map["password"] = psw;

    NetUtils.post(Api.LOGIN, _map).then((data) {
      if (data != null) {}
        Map<String,dynamic> response =  json.decode(data);
        if(response['returnCode']==0){
          DialogUtils.show(context, "提示", "登录成功");
        }else{
          DialogUtils.show(context, "提示", "登录失败，${response['returnMsg']}");
        }
    });
  }
}
