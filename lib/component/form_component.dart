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
            decoration: InputDecoration(
              hintText: "Masukan $fieldName",
              fillColor: ThemeApp.defaultcolor,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
            ),
            onChanged: (value) {
              data[mapKey] = value;
            },
          ),
        ),
      ),
    );
  }
}
