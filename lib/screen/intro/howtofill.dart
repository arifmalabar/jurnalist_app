import 'package:flutter/material.dart';
import 'package:jurnalist_app/screen/auth/auth.dart';
import 'package:jurnalist_app/style/button_style.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class HowToFill extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HowToFillState();
  }
}

class HowToFillState extends State<HowToFill> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Mengisi Jurnal Di Mana Saja Dan Kapanpun",
                style: FontStyleApp.titleStyle(),
              ),
              Text(
                "Dengan Menggunakan Journalist kamu akan mendapatkan keuntungan dan tidak perlu khawatir mnegenai penjurnalan",
                style: FontStyleApp.contentStyle(),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 30),
        height: 40,
        child: ElevatedButton(
          child: Text("LANJUT"),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
                (route) => false);
          },
          style: ButtonStyles.buttonStyleData(
              ThemeApp.maintheme, Colors.white, ThemeApp.maintheme),
        ),
      ),
    );
  }
}
