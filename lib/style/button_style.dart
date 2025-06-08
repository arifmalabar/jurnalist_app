import 'package:flutter/material.dart';

class ButtonStyles {
  static final double ltop = 10;
  static final double lbotom = 10;
  static final double rtop = 10;
  static final double rbottom = 10;
  static final double allborder = 10;

  static ButtonStyle buttonStyleData(
      Color bgcolor, Color fgcolor, Color bordercolor) {
    return ElevatedButton.styleFrom(
      backgroundColor: bgcolor,
      foregroundColor: fgcolor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(allborder),
        side: BorderSide(color: bordercolor, width: 2),
      ),
    );
  }
}
