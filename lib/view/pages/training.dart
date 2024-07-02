import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/view/components/actions/add_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/training_header.dart';


class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Training training = ModalRoute.of(context)?.settings.arguments as Training;
    return Scaffold(
        appBar: TrainingHeader(infos: training),
        body: _main(),
        floatingActionButton: AddButton(callback: () => Navigator.of(context).pushNamed('/exercises')),
      );
  }

  Widget _main() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Button(content: 'Começar', padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 120), callback: (){}),
            const AreaLabel(text: 'Exercícios'),
            _exercises()
          ],
        ),
      ),
    );
  }

  Widget _exercises() {
    return Column(
      children: List.generate(5, (index) => Container()/* const ExerciseLabel(title: '{nome}', subtitle: '{0} series') */),
    );
  }
}
