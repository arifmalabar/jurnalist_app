import 'package:flutter/material.dart';
import 'package:jurnalist_app/screen/auth/auth.dart';
import 'package:jurnalist_app/style/theme.dart';

import '../style/font_style.dart';

class DrawerComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawerComponentState();
  }
}

class DrawerComponentState extends State<DrawerComponent> {
  @override
  Widget build(BuildContext context) {
    return getDrawer();
  }

  Drawer getDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _header(),
          Divider(),
          Text("Menu Utama"),
          _listItem(
            Icon(Icons.home),
            "Home",
            MaterialPageRoute(
              builder: (context) {
                return AuthScreen();
              },
            ),
          ),
          _listItem(
            Icon(Icons.note),
            "Catatan",
            MaterialPageRoute(
              builder: (context) {
                return AuthScreen();
              },
            ),
          ),
          _listItem(
            Icon(Icons.calendar_month),
            "Kalender",
            MaterialPageRoute(
              builder: (context) {
                return AuthScreen();
              },
            ),
          ),
        ],
      ),
    );
  }

  DrawerHeader _drawerHeader() {
    return DrawerHeader(
      child: Text(
        "Menu",
        style: TextStyle(color: ThemeApp.white),
      ),
      decoration: BoxDecoration(
        color: ThemeApp.white,
      ),
    );
  }

  ListTile _header() {
    return ListTile(
      leading: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: ThemeApp.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Icon(
          Icons.person,
          color: ThemeApp.white,
          size: 25,
        ),
      ),
      title: Text(
        "Nama",
        style: TextStyle(
            fontWeight: FontStyleApp.title_weigth,
            fontSize: FontStyleApp.title),
      ),
      subtitle: Text(
        "Nama Instansi",
        style: TextStyle(
            fontWeight: FontStyleApp.subtitle_weight,
            fontSize: FontStyleApp.subtitle),
      ),
    );
  }

  ListTile _listItem(Icon icon, String title, MaterialPageRoute route) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          route,
        );
      },
    );
  }
}
