import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/button.dart';
import 'package:train_in/components/text_input.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 95, left: 15, right: 15, bottom: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _header(),
              _form(),
              _logo()
            ],
          ),
        ));
  }

  Widget _form() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _inputs(),
          Button(content: 'Entrar', padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),),
          _createAccount()
        ],
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
    return Column(
      children: [
        TextBox(content: 'usuário', margin: EdgeInsets.only(bottom: 15)),
        TextBox(content: 'senha', margin: EdgeInsets.only(bottom: 65),),
      ],
    );
  }

  Widget _createAccount() {
    return Container(
      margin: EdgeInsets.only(top: 25),
      width: double.infinity,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(
                  color: Palette.white, width: 2, style: BorderStyle.solid))),
      child: Text('Criar conta',
          style: TextStyle(color: Palette.yellow, fontSize: 12)),
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
        TextSpan(text: 'Train'),
        TextSpan(text: '.in', style: TextStyle(color: Palette.yellow))
      ],
    ));
  }
}
