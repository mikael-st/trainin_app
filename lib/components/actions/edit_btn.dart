import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/assets/trainin_icons.dart';

class EditButton extends StatelessWidget {
  const EditButton({super.key});

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
      icon: Icon(TraininIcons.edit, size: 18, color: Palette.white,),
    );
  }
}