import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 95, left: 15, right: 15, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _header(),
              _form(),
              _logo()
            ],
          ),
        ));
  }

  Widget _form() {
    return SizedBox(
      width: 330,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _inputs(),
          Button(
            content: 'Entrar',
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            callback: (){
              Get.toNamed('/main');
            },
          ),
          _createAccount()
        ],
      ),
    );
  }

  Widget _header() {
    return Text(
        'Entrar na conta',
        style: TextStyle(
            color: Palette.white, fontWeight: FontWeight.bold, fontSize: 20),
      );
  }

  Widget _inputs() {
    return const Column(
      children: [
        TextBox(content: 'usuário', margin: EdgeInsets.only(bottom: 15)),
        TextBox(content: 'senha', margin: EdgeInsets.only(bottom: 65),),
      ],
    );
  }

  Widget _createAccount() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: double.infinity,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Palette.white, width: 2, style: BorderStyle.solid))),
      child: InkWell(
        onTap: () => Get.toNamed('/create_account'),
        child: Text('Criar conta',
          style: TextStyle(color: Palette.yellow, fontSize: 12))
      ),
    );
  }

  Widget _logo() {
    return RichText(
      text: TextSpan(
      style: TextStyle(
        fontSize: 36,
        color: Palette.white,
        fontWeight: FontWeight.bold,
        fontFamily: GoogleFonts.outfit().fontFamily 
      ),
      children: [
        const TextSpan(text: 'Train'),
        TextSpan(text: '.in', style: TextStyle(color: Palette.yellow))
      ],
    ));
  }
}
