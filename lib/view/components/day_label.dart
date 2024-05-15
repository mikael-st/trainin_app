import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class DayLabel extends StatelessWidget {
  final String name;
  final Color color;
  const DayLabel({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 7,
          margin: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50)
          ),
        ),
        Text(name, style: TextStyle(color: Palette.white, fontSize: 12))
      ],
    );
  }
}