import 'package:flutter/material.dart';
import 'package:train_in/assets/globals.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/area_label.dart';
import 'package:train_in/components/headers/header.dart';
import 'package:train_in/components/navbar.dart';
import 'package:train_in/components/training_box.dart';
import 'package:train_in/components/training_label.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Main(),
        bottomNavigationBar: NavBar(),
      );
  }

  Widget Main() {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AreaLabel(text: 'Treino de hoje'),
            TrainingBox(),
            AreaLabel(text: 'Restrospectiva'),
            Retrospective()
          ],
        ),
      ),
    );
  }

  Widget Retrospective() {
    return Column(
      children: List.generate(5, (index) => TrainingLabel(title: '{nome}', subtitle: '{00} min   •   {dia}')),
    );
  }


  Color setLabelColor(int day) {
    if (day == Globals.getToday()) {
      return Palette.white;
    } else {
      return Palette.details;
    }
  }
}
