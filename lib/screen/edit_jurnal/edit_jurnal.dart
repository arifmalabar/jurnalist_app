import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/message_box.dart';
import 'package:jurnalist_app/screen/tambah_jurnal/tambah_jurnal.dart';
import 'package:jurnalist_app/style/button_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class EditJurnal extends TambahJurnal {
  late Map<String, dynamic> item_data;
  EditJurnal(super.key, this.item_data);
  @override
  State<StatefulWidget> createState() {
    return EditJurnalState(item_data);
  }
}

class EditJurnalState extends TambahJurnalState {
  late Map<String, dynamic> item;
  late MessageBox msg;

  EditJurnalState(Map<String, dynamic> item) {
    this.item = item;
  }
  void dropMsg() {
    Navigator.pop(context, false);
  }

  List<Widget> getBtnMessage() {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context, false);
        },
        child: Text("Batal"),
        style: ButtonStyles.buttonStyleData(
          ThemeApp.white,
          ThemeApp.primary,
          ThemeApp.primary,
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        child: Text("Hapus"),
        style: ButtonStyles.buttonStyleData(
          ThemeApp.danger,
          ThemeApp.white,
          ThemeApp.danger,
        ),
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    this.initForm();
    this.nama_kegiatan.text = item["agenda"];
    this.kegiatan.text = "agenda";
    msg = new MessageBox(context);
  }

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
              onPressed: () {
                this.msg.showMessageBox(
                      "Konfirmasi",
                      "Konfirmasi Apakah anda ingin menghapus data",
                      getBtnMessage(),
                    );
              },
              style: ButtonStyles.buttonStyleData(
                  ThemeApp.danger, ThemeApp.white, ThemeApp.danger),
            ),
          ),
        ],
      ),
    );
  }
}
