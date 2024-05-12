import 'package:flutter/material.dart';
import 'package:train_in/components/area_label.dart';
import 'package:train_in/components/button.dart';
import 'package:train_in/components/exercise_label.dart';
import 'package:train_in/components/headers/edit_training_header.dart';


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
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            AreaLabel(text: 'Exercícios'),
            Button(content: 'Adicionar exercício', padding: EdgeInsets.symmetric(horizontal: 90, vertical: 12), callback: (){}),
            _exercises()
          ],
        ),
      ),
    );
  }

  Widget _exercises() {
    return Column(
      children: List.generate(5, (index) => ExerciseLabel(title: '{nome}', subtitle: '{0} series')),
    );
  }
}
