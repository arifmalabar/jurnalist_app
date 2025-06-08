import 'package:flutter/material.dart';

import '../../style/theme.dart';

class AppBarComponent {
  static AppBar appBar(String title) {
    return AppBar(
      elevation: 0,
      title: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: ThemeApp.white,
      iconTheme: IconThemeData(color: ThemeApp.primary),
    );
  }
}
