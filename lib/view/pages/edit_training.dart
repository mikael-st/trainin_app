import 'package:flutter/material.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/edit_training_header.dart';


class EditTrainingPage extends StatelessWidget {
  EditTrainingPage({super.key});

  final List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EditTrainingHeader(),
        body: _main()
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
            const AreaLabel(text: 'Exercícios'),
            Button(content: 'Adicionar exercício', padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12), callback: (){}),
            _exercises()
          ],
        ),
      ),
    );
  }

  Widget _exercises() {
    return Column(
      children: List.generate(5, (index) => const ExerciseLabel(title: '{nome}', subtitle: '{0} series')),
    );
  }
}
