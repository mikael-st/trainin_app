import 'package:flutter/material.dart';
import 'package:train_in/view/assets/globals.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/headers/header.dart';
import 'package:train_in/view/components/navbar.dart';
import 'package:train_in/view/components/training_box.dart';
import 'package:train_in/view/components/training_label.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Main(),
        // bottomNavigationBar: NavBar(),
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
