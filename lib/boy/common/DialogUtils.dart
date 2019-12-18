import 'package:flutter/material.dart';

class DialogUtils {
  static show(BuildContext context, String title, String content) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(content)],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("确定"))
            ],
          );
        });
  }

  static showAndPress(BuildContext context, String title, String content,
      VoidCallback onPressed) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[Text(content)],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed: onPressed, child: Text("确定"))
            ],
          );
        });
  }
}
