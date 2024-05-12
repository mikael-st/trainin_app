import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/assets/trainin_icons.dart';

class ExerciseLabel extends StatelessWidget {
  final String title, subtitle;
  const ExerciseLabel({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        clipBehavior: Clip.hardEdge,
        // width: 330,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Palette.items,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Row(children: [
            _leading(),
            _text(),
          ]),
          _trealing()
        ]),
      ),
    );
  }

  Widget _leading() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 68,
        maxHeight: 68,
        minWidth: 68,
        maxWidth: 68
      ),
      child: Container(
        color: Palette.light_gray,
      ),
    );
  }

  Widget _text() {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: Palette.white, fontSize: 14, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(color: Palette.yellow, fontSize: 12))
      ]),
    );
  }

  Widget _trealing() {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Icon(TraininIcons.go_to, size: 20, color: Palette.light_gray),
    );
  }
}
