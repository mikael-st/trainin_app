import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/assets/trainin_icons.dart';

class TrainingLabel extends StatelessWidget {
  const TrainingLabel({super.key});

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
        title: Text('Nome', style: TextStyle(color: Palette.white, fontSize: 14, fontWeight: FontWeight.w600),),
        subtitle: Text('{00} min   •   {dia}', style: TextStyle(color: Palette.yellow, fontSize: 12)),
        trailing: Icon(TraininIcons.go_to, size: 20, color: Palette.light_gray),
        tileColor: Palette.items,
    ));
  }
}