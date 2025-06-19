import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/form_component.dart';
import 'package:jurnalist_app/component/main_appbar.dart';
import 'package:jurnalist_app/component/tambah_jurnal/app_bar.dart';
import 'package:jurnalist_app/style/theme.dart';

class TambahJurnal extends StatefulWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Container(
          child: TambahJurlnalAppBar.getAppBar("Tambah Jurnal",
              "Input jurnal anda \n untuk menyimpan lebih lanjut"),
        ),
      ),
      body: Stack(
        children: [
          formBody(),
        ],
      ),
      backgroundColor: ThemeApp.maintheme,
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
            this
                .formComponent
                .formField("tanggal_kegiatan", "Tanggal Kegiatan"),
            this.formComponent.formField("status", "Status Kegiatan"),
            this.formComponent.areaTextField("kegiatan", "Kegiatan", 5)
          ],
        ),
      ),
    );
  }
}
