import 'package:flutter/material.dart';
import 'package:jurnalist_app/component/appbar_component.dart';
import 'package:jurnalist_app/component/form_component.dart';
import 'package:jurnalist_app/style/button_style.dart';
import 'package:jurnalist_app/style/font_style.dart';
import 'package:jurnalist_app/style/theme.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends State<RegisterScreen> {
  Map<String, dynamic> data = {"nama": "", "notelp": "", "nama_instansi": ""};
  late FormComponent component;
  RegisterScreenState() {
    this.component = new FormComponent(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.appBar("Register"),
      body: Stack(
        children: [
          itemRegistrasi(),
          btnProsesRegister(),
        ],
      ),
    );
  }

  Widget btnProsesRegister() {
    return Positioned(
      bottom: 25,
      left: 0,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          persetujuan(),
          itemBtnProsesRegister(),
        ],
      ),
    );
  }

  Widget itemRegistrasi() {
    return Positioned(
        top: 0,
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              caption(),
              SizedBox(
                height: 20,
              ),
              this.component.formField("nama", "Nama"),
              Divider(),
              this.component.formField("notelp", "No Telpon"),
              Divider(),
              this.component.formField("nama_instansi", "Nama Instansi"),
            ],
          ),
        ));
  }

  Widget caption() {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      child: Text(
        "Buat akun anda dan manfaatkan keuntungan jika bergabung dengan kami, dan nikmati layanan seanjutnya",
        style: FontStyleApp.subTitleStyle(),
      ),
    );
  }

  Widget itemBtnProsesRegister() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {},
        child: Text("REGISTRASI"),
        style: ButtonStyles.buttonStyleData(
            ThemeApp.primary, ThemeApp.white, ThemeApp.primary),
      ),
    );
  }

  Widget persetujuan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: false,
          onChanged: (value) {},
        ),
        Text("Saya Menyetujui "),
        Text(
          "Persyaratan yang berlaku",
          style: TextStyle(color: ThemeApp.primary),
        )
      ],
    );
  }
}
