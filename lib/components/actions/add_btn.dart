import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: (){},
        shape: CircleBorder(),
        backgroundColor: Palette.yellow,
        child: Icon(Icons.add_rounded, color: Palette.white, size: 32),
      );
  }
}