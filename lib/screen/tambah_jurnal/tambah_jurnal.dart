import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/form_component.dart';
import 'package:jurnalist_app/component/main_appbar.dart';
import 'package:jurnalist_app/component/tambah_jurnal/app_bar.dart';
import 'package:jurnalist_app/main.dart';
import 'package:jurnalist_app/screen/dashboard/dashboard.dart';
import 'package:jurnalist_app/style/theme.dart';

import '../../style/button_style.dart';

class TambahJurnal extends StatefulWidget {
  late String title;
  TambahJurnal(this.title);
  @override
  State<StatefulWidget> createState() {
    return TambahJurnalState();
  }
}

class TambahJurnalState extends State<TambahJurnal> {
  late MainAppBar appbar;
  late FormComponent formComponent;
  Map<String, String> data = {
    "nama_kegiatan": "",
    "tanggal_kegiatan": "",
    "status": "",
    "kegiatan": ""
  };
  TambahJurnalState() {
    this.appbar = new MainAppBar();
    this.formComponent = new FormComponent(data);
  }
  void tambahData() {
    print(data);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MainApp(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          child: TambahJurlnalAppBar.getAppBar("${widget.title} Jurnal",
              "Input jurnal anda \n untuk menyimpan lebih lanjut"),
        ),
      ),
      body: Stack(
        children: [
          formBody(),
        ],
      ),
      backgroundColor: ThemeApp.maintheme,
      bottomNavigationBar: bottomAppBar(),
    );
  }

  Widget formBody() {
    return Positioned(
      top: 100,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeApp.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20),
            this.formComponent.formField("nama_kegiatan", "Nama Kegiatan"),
            SizedBox(height: 10),
            _verticalField(),
            SizedBox(height: 10),
            this.formComponent.areaTextField("kegiatan", "Kegiatan", 5)
          ],
        ),
      ),
    );
  }

  Widget _verticalField() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: this
                .formComponent
                .formField("tanggal_kegiatan", "Tanggal Kegiatan"),
          ),
          Expanded(
            child: this.formComponent.formField("status", "Status Kegiatan"),
          ),
        ],
      ),
    );
  }

  BottomAppBar bottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      child: Container(
        color: ThemeApp.white,
        margin: EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: () {
            tambahData();
          },
          child: Text("TAMBAH JURNAL"),
          style: ButtonStyles.buttonStyleData(
              ThemeApp.maintheme, Colors.white, ThemeApp.maintheme),
        ),
      ),
    );
  }
}
