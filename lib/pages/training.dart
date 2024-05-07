import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/area_label.dart';
import 'package:train_in/components/back_header.dart';
import 'package:train_in/components/button.dart';
import 'package:train_in/components/modals/create_training.dart';
import 'package:train_in/components/navbar.dart';
import 'package:train_in/components/training_label.dart';

class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHeader(),
      body: NoTraining(context),
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
            AreaLabel(text: 'Seus Treinos'),
            Training()
          ],
        ),
      )
    );
  }

  Widget NoTraining(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 90,
      margin: EdgeInsets.only(top: 100),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Você ainda não possui treinos.', style: TextStyle(color: Palette.white),),
            Button(
              content: 'Criar Treino',
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
              callback: () { 
                showModalBottomSheet(context: context, builder: (BuildContext context) => CreateTraining());
              }
            )
          ],
        ),
      );
  }

  Widget Training() {
    return Column(
      children: List.generate(5, (index) => TrainingLabel(title: '{nome}', subtitle: '{00} min   •   {00} exercícios   •   {000} kcal')),
    );
  }
}