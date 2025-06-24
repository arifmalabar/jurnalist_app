import 'package:flutter/material.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class MainAppBar extends StatefulWidget {
  late GlobalKey<ScaffoldState> _scaffoldKey;
  MainAppBar(this._scaffoldKey);
  @override
  State<StatefulWidget> createState() {
    return MainAppBarState();
  }
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return getAppBar();
  }

  AppBar getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: accountWidget(),
      elevation: 0,
      backgroundColor: ThemeApp.maintheme,
      actions: [_burgerWidget()],
    );
  }

  Widget accountWidget() {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: ThemeApp.primary,
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Icon(
          Icons.person,
          color: ThemeApp.white,
          size: 40,
        ),
      ),
      title: Text(
        "Nama",
        style: TextStyle(
            color: ThemeApp.white,
            fontWeight: FontStyleApp.title_weigth,
            fontSize: FontStyleApp.title),
      ),
      subtitle: Text(
        "Nama Instansi",
        style: TextStyle(
          color: ThemeApp.white,
          fontWeight: FontStyleApp.subtitle_weight,
          fontSize: FontStyleApp.subtitle,
        ),
      ),
    );
  }

  Widget _burgerWidget() {
    return InkWell(
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.white.withOpacity(0.2),
          border: Border.all(color: ThemeApp.white, width: 1),
        ),
        child: Icon(Icons.view_stream),
      ),
      onTap: () {
        return widget._scaffoldKey.currentState?.openDrawer();
      },
    );
  }
}
