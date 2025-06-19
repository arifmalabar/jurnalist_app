import 'package:flutter/material.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class FormComponent {
  Map<String, dynamic> data = {};
  FormComponent(this.data);
  Widget formField(String mapKey, String fieldName) {
    return Container(
      child: ListTile(
        title: Text(
          fieldName,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Container(
          child: TextField(
            style: FontStyleApp.contentStyle(),
            decoration: _getInputDecoration(fieldName),
            onChanged: (value) {
              data[mapKey] = value;
            },
          ),
        ),
      ),
    );
  }

  Widget areaTextField(String mapKey, String fieldName, int lines) {
    return Container(
      child: ListTile(
        title: Text(
          fieldName,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Container(
          child: TextField(
            style: FontStyleApp.contentStyle(),
            decoration: _getInputDecoration(fieldName),
            onChanged: (value) {
              data[mapKey] = value;
            },
            maxLines: lines,
          ),
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration(String hint) {
    return InputDecoration(
      hintText: "Masukan $hint",
      filled: true,
      fillColor: ThemeApp.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: ThemeApp.defaultcolor),
      ),
    );
  }
}
