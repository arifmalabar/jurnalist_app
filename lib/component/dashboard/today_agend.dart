import 'package:flutter/material.dart';
import 'package:jurnalist_app/screen/edit_jurnal/edit_jurnal.dart';

import '../../style/font_style.dart';
import '../../style/theme.dart';

class TodayAgend extends StatefulWidget {
  @override
  State<TodayAgend> createState() {
    return TodayAgendScreen();
  }
}

class TodayAgendScreen extends State<TodayAgend> {
  List<Map<String, dynamic>> data_agenda = [
    {"id": "1", "time": "10:00", "agenda": "Iterasi 1"},
    {"id": "2", "time": "12:00", "agenda": "Iterasi 2"}
  ];
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
          child: ListView.builder(
            itemCount: data_agenda.length,
            itemBuilder: (context, index) {
              return _itemAgenda(data_agenda[index]);
            },
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

  Widget _itemAgenda(Map<String, dynamic> item) {
    return SizedBox(
      width: double.infinity, // Match parent
      child: InkWell(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _time(item["time"]), // Misal widget jam
                SizedBox(width: 20),
                Expanded(
                  child: _content(item["agenda"]),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditJurnal("Edit", item),
            ),
          );
        },
      ),
    );
  }

  Widget _time(String time) {
    return Container(
      height: 80,
      width: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: ThemeApp.primary, width: 4),
      ),
      child: Text(
        time,
        style: FontStyleApp.titleStyle(),
      ),
    );
  }

  Widget _content(String agenda) {
    return SizedBox(
      height: 100,
      width: 150,
      child: ListTile(
        title: Text(
          agenda,
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
