import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/assets/trainin_icons.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        print('hi');
      },
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(),
        padding: EdgeInsets.all(0),
        alignment: Alignment.centerLeft
      ),
      icon: Icon(TraininIcons.check, size: 18, color: Palette.white,),
    );
  }
}