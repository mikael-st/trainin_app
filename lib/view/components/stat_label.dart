import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class StatLabel extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const StatLabel({super.key, required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Palette.yellow),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Palette.white, fontSize: 12)),
              Text(subtitle, style: TextStyle(color: Palette.white, fontSize: 12, fontWeight: FontWeight.bold))
            ]
          )
        )
      ],
    );
  }
}