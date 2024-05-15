import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class AutoSizeTextField extends StatelessWidget {
  final String label;
  const AutoSizeTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: IntrinsicWidth(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: label,
          hintStyle: TextStyle(color: Palette.white, fontSize: 14),
          filled: true,
          fillColor: Palette.transparent,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Palette.yellow)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Palette.yellow)
          )
        ),
        style: TextStyle(color: Palette.white, fontSize: 12),
      )),
    );
  }
}