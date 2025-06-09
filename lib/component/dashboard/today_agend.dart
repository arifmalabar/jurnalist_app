import 'package:flutter/material.dart';

import '../../style/font_style.dart';
import '../../style/theme.dart';

class TodayAgend extends StatefulWidget {
  @override
  State<TodayAgend> createState() {
    return TodayAgendScreen();
  }
}

class TodayAgendScreen extends State<TodayAgend> {
  @override
  Widget build(BuildContext context) {
    return this.todayAgend();
  }

  Widget todayAgend() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.23,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        decoration: BoxDecoration(
          color: ThemeApp.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 5),
          child: ListView(
            shrinkWrap: true,
            children: [
              _getTitle(),
              _itemAgenda(),
              _itemAgenda(),
              _itemAgenda(),
              _itemAgenda(),
              _itemAgenda()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Text(
      "Agenda",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: FontStyleApp.title,
        fontWeight: FontStyleApp.title_weigth,
      ),
    );
  }

  Widget _listAgenda() {
    return ListView(
      children: [
        _itemAgenda(),
        _itemAgenda(),
        _itemAgenda(),
        _itemAgenda(),
        _itemAgenda()
      ],
    );
  }

  Widget _itemAgenda() {
    return SizedBox(
      width: double.infinity, // Match parent
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _time(), // Misal widget jam
              SizedBox(width: 20),
              Expanded(
                  child: _content()), // ✅ Supaya _content fleksibel lebarnya
            ],
          ),
        ),
      ),
    );
  }

  Widget _time() {
    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: ThemeApp.primary, width: 4),
      ),
      child: Text(
        "10.10",
        style: FontStyleApp.titleStyle(),
      ),
    );
  }

  Widget _content() {
    return SizedBox(
      height: 100,
      width: 150,
      child: ListTile(
        title: Text(
          "Agenda1",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        subtitle: LinearProgressIndicator(
          value: 0.5, // 50%
          backgroundColor: Colors.grey[300],
          color: Colors.blue,
        ),
      ),
    );
  }
}
