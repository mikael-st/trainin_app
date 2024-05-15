import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';

class TrainingLabel extends StatelessWidget {
  final String title, subtitle;
  const TrainingLabel({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      child: ListTile(
        onTap: (){},
        // style: ListTileStyle.list,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        title: Text(title, style: TextStyle(color: Palette.white, fontSize: 14, fontWeight: FontWeight.w600),),
        subtitle: Text(subtitle, style: TextStyle(color: Palette.yellow, fontSize: 12)),
        trailing: Icon(TraininIcons.go_to, size: 20, color: Palette.light_gray),
        tileColor: Palette.items,
    ));
  }
}