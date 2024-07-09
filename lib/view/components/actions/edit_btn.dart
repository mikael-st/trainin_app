import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';

class EditButton extends StatelessWidget {
  final int trainingId;
  EditButton({super.key, required this.trainingId});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        Navigator.of(context).pushNamed('/edit_training', arguments: trainingId);
      },
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.all(0),
        alignment: Alignment.centerLeft
      ),
      icon: Icon(TraininIcons.edit, size: 18, color: Palette.white,),
    );
  }
}