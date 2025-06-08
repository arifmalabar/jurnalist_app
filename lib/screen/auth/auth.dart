import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/form_component.dart';
import 'package:jurnalist_app/screen/auth/register.dart';
import 'package:jurnalist_app/screen/dashboard/dashboard.dart';
import 'package:jurnalist_app/style/button_style.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AuthScreenState();
  }
}

class AuthScreenState extends State<AuthScreen> {
  Map<String, dynamic> auth_data = {"username": "", "password": ""};
  late FormComponent formComponent;
  void initState() {
    super.initState();
    this.formComponent = new FormComponent(auth_data);
  }

  AuthScreenState() {
    this.formComponent = new FormComponent(auth_data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: ThemeApp.maintheme,
        child: Stack(
          children: [
            _loginCard(),
            _roundedFirstDecoration(),
            _roundedSecondDecoration(),
          ],
        ),
      ),
    );
  }

  Widget _roundedSecondDecoration() {
    return Positioned(
      top: 120,
      right: -40,
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.white.withOpacity(0.1),
      ),
    );
  }

  Widget _roundedFirstDecoration() {
    return Positioned(
      top: 10,
      left: -23,
      child: CircleAvatar(
        radius: 80,
        backgroundColor: Colors.white.withOpacity(0.1),
      ),
    );
  }

  Widget _loginCard() {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.30,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 10,
        decoration: BoxDecoration(
          color: ThemeApp.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            _welcomeText(),
            Container(
              height: 20,
            ),
            formComponent.formField("username", "Username"),
            Divider(),
            formComponent.formField("password", "Password"),
            Divider(),
            btnProses(),
            orWith(),
            btnLoginGoogle()
          ],
        ),
      ),
    );
  }

  Widget orWith() {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text("Atau Gunakan"),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget btnProses() {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: ElevatedButton(
        child: Text("LOGIN"),
        style: ButtonStyles.buttonStyleData(
            ThemeApp.primary, Colors.white, ThemeApp.primary),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
              (route) => false);
        },
      ),
    );
  }

  Widget btnLoginGoogle() {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.person), Text("REGISTRASI")],
        ),
        style: ButtonStyles.buttonStyleData(
            ThemeApp.white, ThemeApp.primary, ThemeApp.primary),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen()));
        },
      ),
    );
  }

  Widget _welcomeText() {
    return ListTile(
      title: Text(
        "Selamat Datang",
        style: FontStyleApp.titleStyle(),
      ),
      subtitle: Text(
        "Silahkam masukan nomor telepon anda untuk akses akun, dan nikmati layanan terbaik kami!",
        style: FontStyleApp.subTitleStyle(),
      ),
    );
  }
}
