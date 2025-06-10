import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jurnalist_app/screen/auth/auth.dart';
import 'package:jurnalist_app/screen/intro/howtofill.dart';
import 'package:jurnalist_app/style/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(
      'id_ID', null); // Inisialisasi locale Indonesia
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jurnalist App',
      theme: ThemeData(
        primaryColor: ThemeApp.maintheme,
      ),
      home: AuthScreen(),
    );
  }
}
