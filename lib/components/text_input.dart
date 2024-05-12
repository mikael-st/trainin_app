import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';

class TextBox extends StatelessWidget {
  final String content;
  final EdgeInsets? margin;
  TextBox({super.key, required this.content, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container (
      margin: margin,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12),
          hintText: content,
          hintStyle: TextStyle(color: Palette.white, fontSize: 14),
          filled: true,
          fillColor: Palette.items,
          border: InputBorder.none
        ),
        style: TextStyle(color: Palette.white, fontSize: 12),
      ),
    );

    /* Container(
      // padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
      margin: EdgeInsets.only(bottom: 15),
      width: 280,
      height: 35,
      decoration: BoxDecoration(
        color: Palette.items,
        borderRadius: BorderRadius.circular(6)
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(color: Palette.white, fontSize: 12),
          border: InputBorder.none,
        )
      )
    ); */
  }
}
