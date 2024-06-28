import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pop();
      },
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.all(12),
        alignment: Alignment.centerLeft
      ),
      icon: Icon(TraininIcons.back, size: 20, color: Palette.white,),
    );
  }
}