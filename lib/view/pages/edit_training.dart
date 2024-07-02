import 'package:flutter/material.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/edit_training_header.dart';

// ignore: must_be_immutable
class EditTrainingPage extends StatelessWidget {
  final List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];
  // late ExerciseRepository _repository;

  EditTrainingPage({super.key, /* required ExerciseRepository repository */})/* {
    _repository = repository;
  } */;

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
            Button(content: 'Concluir', padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12), callback: (){}),
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
