import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/button.dart';
import 'package:train_in/components/text_input.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

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
          Button(
            content: 'Criar conta',
            padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            callback: (){},
          ),
        ],
      );
  }

  Widget _header() {
    return Container(
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Criar uma conta',
            style: TextStyle(
              color: Palette.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(
            'Crie sua conta abaixo',
            style: TextStyle(
              color: Palette.white, fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _inputs() {
    return Container(
      width: 330,
      child: Column(
        children: [
          TextBox(content: 'Nome', margin: EdgeInsets.only(bottom: 15)),
          TextBox(content: 'Usuário', margin: EdgeInsets.only(bottom: 15)),
          TextBox(content: 'Senha', margin: EdgeInsets.only(bottom: 15)),
          TextBox(content: 'Confirmar senha', margin: EdgeInsets.only(bottom: 65)),
        ],
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
        TextSpan(text: 'Train'),
        TextSpan(text: '.in', style: TextStyle(color: Palette.yellow))
      ],
    ));
  }
}
