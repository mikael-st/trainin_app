import 'package:flutter/material.dart';
import 'package:train_in/assets/globals.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/day_label.dart';
import 'package:train_in/components/options_btn.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget implements PreferredSizeWidget {
  Header({super.key});

  List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        backgroundColor: Palette.items,
        title: Text('Bom dia, user', style: TextStyle(color: Palette.white, fontSize: 14)),
        actions: [OptionsButton()],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Padding(
            padding: EdgeInsets.only(top: 8, bottom: 12, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: days.map((d) => DayLabel(name: d, color: setLabelColor(days.indexOf(d)),)).toList()))),
        ));
  }

  Color setLabelColor(int day) {
    if (day == Globals.getToday()) {
      return Palette.white;
    } else {
      return Palette.details;
    }
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100);
}