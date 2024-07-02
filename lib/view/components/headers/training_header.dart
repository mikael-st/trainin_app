import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';
import 'package:train_in/view/components/actions/back_btn.dart';
import 'package:train_in/view/components/actions/edit_btn.dart';
import 'package:train_in/view/components/stat_label.dart';

class TrainingHeader extends StatelessWidget implements PreferredSizeWidget {
  final Training infos;
  const TrainingHeader({super.key, required this.infos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        backgroundColor: Palette.items,
        leading: const BackBtn(),
        actions: const [EditButton()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            height: 100,
            margin: const EdgeInsets.only(top: 8, bottom: 20, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('${infos.name}', style: TextStyle(color: Palette.white, fontSize: 20, fontWeight: FontWeight.bold)),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  StatLabel(icon: TraininIcons.clock, title: 'Duração', subtitle: '{00} min'),
                  StatLabel(icon: TraininIcons.kcal, title: 'Calorias', subtitle: '{000} kcal'),
                  StatLabel(icon: TraininIcons.dumbell, title: 'Peso', subtitle: '{00} Kg'),
                ],
              )
            ],
          ))),
        ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(200);
}