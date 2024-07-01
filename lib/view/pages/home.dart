import 'package:flutter/material.dart';
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
        body: _main(),
        bottomNavigationBar: NavBar(),
      );
  }

  Widget _main() {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AreaLabel(text: 'Treino de hoje'),
            const TrainingBox(),
            const AreaLabel(text: 'Restrospectiva'),
            _retrospective()
          ],
        ),
      ),
    );
  }

  Widget _retrospective() {
    return Column(
      children: List.generate(5, (index) => TrainingLabel(title: '{nome}', subtitle: '{00} min   •   {dia}', callback: (){})),
    );
  }
}
