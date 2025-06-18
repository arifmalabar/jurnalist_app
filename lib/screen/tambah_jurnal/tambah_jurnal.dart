import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/main_appbar.dart';

class TambahJurnal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TambahJurnalState();
  }
}

class TambahJurnalState extends State<TambahJurnal> {
  late MainAppBar appbar;
  TambahJurnalState() {
    this.appbar = new MainAppBar();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: Center(
        child: Text("tambah Data"),
      ),
    );
  }
}
