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

  Widget formFieldController(
      String fieldName, TextEditingController controller) {
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
            controller: controller,
          ),
        ),
      ),
    );
  }

  Widget areaTextFieldController(
      String fieldName, int lines, TextEditingController controller) {
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
            controller: controller,
            maxLines: lines,
          ),
        ),
      ),
    );
  }

  Widget datePickerField(String fieldName, TextEditingController controller,
      BuildContext context) {
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
            controller: controller,
            onTap: () => getDate(controller, context),
          ),
        ),
      ),
    );
  }

  Widget formFieldComboBox(String fieldName, String key) {
    List<String> opt = ["Selesai", "Belum"];
    String selected = "";
    return Container(
      child: ListTile(
        title: Text(
          fieldName,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        subtitle: Container(
          child: DropdownButtonFormField(
            decoration: _getInputDecoration("Masukan text"),
            items: opt.map(
              (String e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              },
            ).toList(),
            onChanged: (value) {
              data[key] = value!;
            },
          ),
        ),
      ),
    );
  }

  Future<void> getDate(
      TextEditingController controller, BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null) {
      controller.text = "${picked.year}-${picked.month}-${picked.day}";
    }
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
