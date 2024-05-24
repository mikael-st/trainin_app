import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/text_input.dart';

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 95, left: 15, right: 15, bottom: 35),
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
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 8),
            callback: (){
              Get.toNamed('/main');
            },
          ),
        ],
      );
  }

  Widget _header() {
    return SizedBox(
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
    return const SizedBox(
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
        const TextSpan(text: 'Train'),
        TextSpan(text: '.in', style: TextStyle(color: Palette.yellow))
      ],
    ));
  }
}
