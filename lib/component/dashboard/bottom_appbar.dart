import 'package:flutter/material.dart';
import 'package:jurnalist_app/screen/account/account.dart';
import 'package:jurnalist_app/screen/dashboard/dashboard.dart';
import 'package:jurnalist_app/screen/riwayat/riwayat.dart';
import 'package:jurnalist_app/style/theme.dart';

class BottomAppComponent extends StatefulWidget {
  int curindex = 0;

  @override
  State<StatefulWidget> createState() {
    return BottomAppComponentState();
  }
}

class BottomAppComponentState extends State<BottomAppComponent> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        menuItem(Icons.home, "Dashboard"),
        menuItem(Icons.book, "WorkBook"),
        menuItem(Icons.abc, ""),
        menuItem(Icons.timer, "Riwayat"),
        menuItem(Icons.person, "Akun")
      ],
      currentIndex: widget.curindex,
      fixedColor: ThemeApp.maintheme,
      showUnselectedLabels: true,
      unselectedItemColor: ThemeApp.primary,
      onTap: (value) {
        setState(() {
          widget.curindex = value;
        });
      },
    );
  }

  BottomNavigationBarItem menuItem(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
