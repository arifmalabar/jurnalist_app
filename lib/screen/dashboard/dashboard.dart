import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/dashboard/bottom_appbar.dart';
import 'package:jurnalist_app/component/dashboard/time_component.dart';
import 'package:jurnalist_app/component/dashboard/today_agend.dart';
import 'package:jurnalist_app/component/drawer_component.dart';
import 'package:jurnalist_app/component/main_appbar.dart';
import 'package:jurnalist_app/screen/account/account.dart';
import 'package:jurnalist_app/screen/riwayat/riwayat.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> {
  late MainAppBar appbar;
  late TimeComponent timeComponent;
  late TodayAgend todayAgend;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DashboardScreenState() {
    this.appbar = new MainAppBar(this._scaffoldKey);
    this.timeComponent = new TimeComponent();
    this.todayAgend = new TodayAgend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Container(
          margin: EdgeInsets.only(top: 10, right: 15),
          child: this.appbar,
        ),
      ),
      body: Stack(
        children: [this.timeComponent, this.todayAgend],
      ),
      backgroundColor: ThemeApp.maintheme,
      drawer: DrawerComponent(),
    );
  }

  TextStyle fontItemStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontStyleApp.title_weigth,
      fontSize: FontStyleApp.title,
    );
  }

  TextStyle timeStyle() {
    return TextStyle(
      color: ThemeApp.white,
      fontWeight: FontStyleApp.subtitle_weight,
    );
  }

  AppBar appBar() {
    return AppBar();
  }
}
