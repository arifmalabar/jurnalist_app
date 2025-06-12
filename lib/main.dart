import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jurnalist_app/screen/account/account.dart';
import 'package:jurnalist_app/screen/auth/auth.dart';
import 'package:jurnalist_app/screen/dashboard/dashboard.dart';
import 'package:jurnalist_app/screen/intro/howtofill.dart';
import 'package:jurnalist_app/screen/riwayat/riwayat.dart';
import 'package:jurnalist_app/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(
      'id_ID', null); // Inisialisasi locale Indonesia
  runApp(MyApp(false));
}

class MyApp extends StatelessWidget {
  late bool isLogedin;
  MyApp(this.isLogedin);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalist App',
      theme: ThemeData(
        primaryColor: ThemeApp.maintheme,
        useMaterial3: false,
      ),
      home: (isLogedin) ? MainApp() : AuthScreen(),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainAppState();
  }
}

class MainAppState extends State<MainApp> {
  int curindex = 0;
  List screens = [
    DashboardScreen(),
    AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[curindex],
      bottomNavigationBar: getBottomAppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
        backgroundColor: ThemeApp.maintheme,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomAppBar getBottomAppBar() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: getBottomNavBar(),
    );
  }

  BottomNavigationBar getBottomNavBar() {
    return BottomNavigationBar(
      items: [
        menuItem(Icons.home, "Dashboard"),
        menuItem(Icons.person, "Account")
      ],
      currentIndex: curindex,
      fixedColor: ThemeApp.maintheme,
      unselectedItemColor: ThemeApp.primary,
      type: BottomNavigationBarType.fixed,
      onTap: (value) {
        setState(() {
          curindex = value;
        });
      },
    );
  }

  BottomNavigationBarItem menuItem(IconData icon, String title) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
