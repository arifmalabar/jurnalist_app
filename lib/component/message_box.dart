import 'package:flutter/material.dart';

class MessageBox {
  late BuildContext context;
  MessageBox(this.context);
  bool showMessageBox(String title, String content, List<Widget> btnComponent) {
    bool status = false;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: btnComponent,
      ),
    ).then((value) {
      status = value;
    });
    return status;
  }
}
