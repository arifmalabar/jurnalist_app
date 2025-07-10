import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/button/base_button.dart';
import 'package:jurnalist_app/style/theme.dart';

class DangerButton extends BaseButton {
  final VoidCallback callback;
  final String text;
  DangerButton({required this.text, required this.callback}) {
    this.bgcolor = ThemeApp.danger;
    this.bordercolor = ThemeApp.danger;
    this.fgcolor = ThemeApp.white;
  }
}
