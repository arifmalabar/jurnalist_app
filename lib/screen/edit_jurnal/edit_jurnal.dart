import 'package:flutter/material.dart';
import 'package:jurnalist_app/screen/tambah_jurnal/tambah_jurnal.dart';
import 'package:jurnalist_app/style/button_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class EditJurnal extends TambahJurnal {
  EditJurnal(super.key);
  @override
  State<StatefulWidget> createState() {
    return EditJurnalState();
  }
}

class EditJurnalState extends TambahJurnalState {
  @override
  BottomAppBar bottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 8, right: 8),
            child: ElevatedButton(
              child: Text("EDIT DATA"),
              onPressed: () {
                this.tambahData();
              },
              style: ButtonStyles.buttonStyleData(
                  ThemeApp.white, ThemeApp.warning, ThemeApp.warning),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: 8, right: 8),
            child: ElevatedButton(
              child: Text("HAPUS DATA"),
              onPressed: () {},
              style: ButtonStyles.buttonStyleData(
                  ThemeApp.danger, ThemeApp.white, ThemeApp.danger),
            ),
          ),
        ],
      ),
    );
  }
}
