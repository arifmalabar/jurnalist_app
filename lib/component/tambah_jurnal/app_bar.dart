import 'package:flutter/material.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class TambahJurlnalAppBar {
  static AppBar getAppBar(String title, String subtitle) {
    return AppBar(
      elevation: 0,
      backgroundColor: ThemeApp.maintheme,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                title,
                style: FontStyleApp.titleStyle(),
              ),
              Text(
                subtitle,
                style: FontStyleApp.subTitleStyle(),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
