import 'package:flutter/material.dart';

class FontStyleApp {
  static final double content = 12;
  static final double subtitle = 15;
  static final double title = 25;
  static final double label = 8;

  static final FontWeight content_weight = FontWeight.w200;
  static final FontWeight subtitle_weight = FontWeight.w300;
  static final FontWeight title_weigth = FontWeight.w500;
  static final FontWeight label_weight = FontWeight.w200;

  static TextStyle? contentStyle() {
    return _getStyle(content, content_weight);
  }

  static TextStyle? subTitleStyle() {
    return _getStyle(subtitle, subtitle_weight);
  }

  static TextStyle? titleStyle() {
    return _getStyle(title, title_weigth);
  }

  static TextStyle? labelStyle() {
    return _getStyle(label, label_weight);
  }

  static TextStyle? _getStyle(double size, FontWeight weight) {
    return TextStyle(fontWeight: weight, fontSize: size, color: Colors.black);
  }
}
