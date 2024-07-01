import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/add_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/headers/back_header.dart';
import 'package:train_in/view/components/modals/create_training.dart';
import 'package:train_in/view/components/navbar.dart';
import 'package:train_in/view/components/training_label.dart';

class MyWorkoutsPage extends StatelessWidget {
  const MyWorkoutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackHeader(),
      body: _main(context),
      bottomNavigationBar: NavBar(),
      floatingActionButton: AddButton(callback: () => showModalBottomSheet(context: context, builder: (BuildContext context) => const CreateTraining())),
    );
  }

  Widget _main(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AreaLabel(text: 'Seus Treinos'),
            _training(context)
          ],
        ),
      )
    );
  }

  Widget _noTraining(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 90,
      margin: const EdgeInsets.only(top: 100),
      child: Text('Você ainda não possui treinos.', style: TextStyle(color: Palette.white),),
    );
  }

  Widget _training(BuildContext ctx) {
    return Column(
      children: List.generate(5, (index) => TrainingLabel(title: '{nome}', subtitle: '{00} min   •   {00} exercícios   •   {000} kcal', callback: () => Navigator.of(ctx).pushNamed('/training'))),
    );
  }
}