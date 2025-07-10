import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/button/base_button.dart';
import 'package:jurnalist_app/component/button/danger_button.dart';
import 'package:jurnalist_app/style/theme.dart';

class SuccessButton extends DangerButton {
  SuccessButton({required super.text, required super.callback}) {
    this.bgcolor = ThemeApp.success;
    this.bordercolor = ThemeApp.success;
    this.fgcolor = ThemeApp.white;
  }
}
