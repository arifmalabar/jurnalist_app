import 'package:flutter/material.dart';
import 'package:jurnalist_app/style/button_style.dart';

class BaseButton extends StatelessWidget {
  late String text;
  late Color bgcolor, fgcolor, bordercolor;
  late VoidCallback onClick;
  late double allborder = 10;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClick,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: bgcolor,
        foregroundColor: fgcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(allborder),
          side: BorderSide(color: bordercolor, width: 2),
        ),
      ),
    );
  }
}
