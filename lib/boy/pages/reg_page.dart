import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/boy/common/DialogUtils.dart';
import 'package:flutter_app/boy/common/ToastUtils.dart';
import 'package:flutter_app/boy/pages/login_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  TextEditingController _accountController = TextEditingController();
  TextEditingController _nickNameController = TextEditingController();
  TextEditingController _pswController = TextEditingController();
  File imageHead = null;

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
                child: imageHead == null
                    ? ClipRRect(
                        //头像
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.asset(
                          "assets/test.jpeg",
                          fit: BoxFit.fill,
                          height: 60,
                          width: 60,
                        ),
                      )
                    : ClipRRect(
                        //头像
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Image.file(
                          imageHead,
                          fit: BoxFit.fill,
                          height: 60,
                          width: 60,
                        ),
                      ),
                onTap: () {
                  getAvatarImage();
                },
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
                controller: _accountController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "请输入11位手机号"),
              ),
              TextField(
                controller: _nickNameController,
                decoration: InputDecoration(hintText: "请输入您的昵称"),
              ),
              TextField(
                controller: _pswController,
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
                  onPressed: () {
                    _doReg(_accountController.text, _nickNameController.text,
                        _pswController.text);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _doReg(String account, String nickName, String psw) async {
    if (account.isEmpty || nickName.isEmpty || psw.isEmpty) {
      DialogUtils.show(context, '提示', '内容不能为空');
      return;
    }

    //todo 获取实例
    var spInstance = await SharedPreferences.getInstance();
    await spInstance.setString('account', account);
    await spInstance.setString('psw', psw);
    await spInstance.setString('nickName', nickName);

    if (imageHead != null && imageHead.path.isNotEmpty) {
      await spInstance.setString('imageHead', imageHead.path);
    }

    ToastUtils.toast('注册成功');

//    DialogUtils.showAndPress(context, '提示', '注册成功', () {
//
//      //关闭弹窗
//      Navigator.pop(context);
//
//
//      //todo 退出当前页面
//      Navigator.pushAndRemoveUntil(
//          context,
//          MaterialPageRoute(builder: (context) => new LoginPage()),
//          (route) => route == null);
//    });
  }

  //TODO 选择头像
  Future<File> getAvatarImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageHead = image;
    });
  }
}
