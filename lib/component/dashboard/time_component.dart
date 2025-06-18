import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../style/font_style.dart';
import '../../style/theme.dart';

class TimeComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TimeComponentState();
  }
}

class TimeComponentState extends State<TimeComponent> {
  int selectedindex = 0;

  int selectedMonth = 6; // Juni
  int selectedYear = 2025;

  List<Map<String, dynamic>> generateDatesInMonth(int month, int year) {
    List<Map<String, dynamic>> dates = [];

    // Mulai dari tanggal 1
    DateTime date = DateTime(year, month, 1);

    while (date.month == month) {
      String dayname = DateFormat("E", 'id_ID').format(date);
      dates.add({"tgl": date.day, "hari": dayname});
      date = date.add(Duration(days: 1)); // Tambah 1 hari
    }

    return dates;
  }

  @override
  Widget build(BuildContext context) {
    return timeContainer();
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
    List<String> months = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return ListTile(
      leading: Text(
        "${months[selectedMonth - 1]}",
        style: timeStyle(),
      ),
      trailing: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Text(
          selectedYear.toString(),
          style: timeStyle(),
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Pilih Bulan Dan Tahun',
                    style: FontStyleApp.subTitleStyle(),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  listTime(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('PILIH BULAN & TAHUN'),
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Row listTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton<int>(
          hint: Text("Bulan $selectedMonth"),
          items: List.generate(12, (index) {
            int bln = index + 1;
            return DropdownMenuItem(
              child: Text("Bulan $bln"),
              value: bln,
            );
          }),
          onChanged: (value) {
            setState(() {
              selectedMonth = value!;
              Navigator.pop(context);
            });
          },
        ),
        Divider(),
        DropdownButton(
          items: List.generate(2, (index) {
            return DropdownMenuItem(
              child: Text("Tahun "),
              value: index,
            );
          }),
          onChanged: (value) {},
        )
      ],
    );
  }

  Widget showDay() {
    List<Map<String, dynamic>> dateList =
        generateDatesInMonth(selectedMonth, selectedYear);
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: dateList.length,
        itemBuilder: (context, index) {
          if (selectedindex == index) {
            return activedDayItem(dateList[index], index);
          } else {
            return dayItem(dateList[index], index);
          }
        },
      ),
    );
  }

  Widget dayItem(Map<String, dynamic> item, int index) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
            width: 2,
          ),
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              item["hari"],
              style: fontItemStyle(),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              item["tgl"].toString(),
              style: fontItemStyle(),
            ),
          ],
        ),
      ),
      onTap: () {
        setState(() {
          selectedindex = index;
        });
      },
    );
  }

  Widget activedDayItem(Map<String, dynamic> item, int index) {
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
            item["hari"],
            style: fontItemStyle(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            item["tgl"].toString(),
            style: fontItemStyle(),
          ),
        ],
      ),
    );
  }

  TextStyle timeStyle() {
    return TextStyle(
      color: ThemeApp.white,
      fontWeight: FontStyleApp.subtitle_weight,
    );
  }

  TextStyle fontItemStyle() {
    return TextStyle(
      color: Colors.white,
      fontWeight: FontStyleApp.title_weigth,
      fontSize: FontStyleApp.title,
    );
  }
}
