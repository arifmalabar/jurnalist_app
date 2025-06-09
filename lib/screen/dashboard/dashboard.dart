import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/dashboard/time_component.dart';
import 'package:jurnalist_app/component/dashboard/today_agend.dart';
import 'package:jurnalist_app/component/main_appbar.dart';
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
  DashboardScreenState() {
    this.appbar = new MainAppBar();
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
          child: this.appbar.getAppBar(),
        ),
      ),
      body: Stack(
        children: [this.timeComponent.timeContainer(), this.todayAgend],
      ),
      backgroundColor: ThemeApp.maintheme,
    );
  }

  Widget timeContainer() {
    return Positioned(
      top: 5,
      bottom: 0,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [timeWidget(), showDay()],
      ),
    );
  }

  Widget timeWidget() {
    return ListTile(
      leading: Text(
        "Bulan",
        style: timeStyle(),
      ),
      trailing: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(
          "Tahun",
          style: timeStyle(),
        ),
      ),
    );
  }

  Widget showDay() {
    return SizedBox(
      height: 100,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          activedDayItem(),
          dayItem(),
          dayItem(),
          dayItem(),
          dayItem(),
          dayItem(),
        ],
      ),
    );
  }

  Widget dayItem() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sun",
            style: fontItemStyle(),
          ),
          Divider(),
          Text(
            "12",
            style: fontItemStyle(),
          ),
        ],
      ),
    );
  }

  Widget activedDayItem() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeApp.warning,
          width: 2,
        ),
        color: ThemeApp.warning,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Sun",
            style: fontItemStyle(),
          ),
          Divider(),
          Text(
            "12",
            style: fontItemStyle(),
          ),
        ],
      ),
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
