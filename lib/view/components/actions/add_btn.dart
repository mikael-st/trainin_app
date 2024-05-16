import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class AddButton extends StatelessWidget {
  final Function() callback;
  const AddButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: callback,
        shape: CircleBorder(),
        backgroundColor: Palette.yellow,
        child: Icon(Icons.add_rounded, color: Palette.white, size: 32),
      );
  }
}