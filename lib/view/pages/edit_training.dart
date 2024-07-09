import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/service/repositories/training_repository.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/check_day.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/edit_training_header.dart';

// ignore: must_be_immutable
class EditTrainingPage extends StatelessWidget {
  List<CheckDay> days = [
    CheckDay(label: 'Dom'),
    CheckDay(label: 'Seg'),
    CheckDay(label: 'Ter'),
    CheckDay(label: 'Quar'),
    CheckDay(label: 'Quin'),
    CheckDay(label: 'Sex'),
    CheckDay(label: 'Sab')
  ];
  late TrainingRepository _repository;

  EditTrainingPage({super.key, required TrainingRepository repository}) {
    _repository = repository;
  }

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as int;
    final training = _repository.find(id)!;
    return Scaffold(
      appBar: EditTrainingHeader(trainingName: training.name, daysValues: training.days),
      body: _main(training)
    );
  }

  Widget _main(Training training) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const AreaLabel(text: 'Exercícios'),
            Button(content: 'Concluir', padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 12), callback: (){}),
            _exercises(training.exercises)
          ],
        ),
      ),
    );
  }

  Widget _exercises(List<Exercise> exercises) {
    return Column(
      children: List.generate(
        exercises.length,
        (index) => ExerciseLabel(exercise: exercises[index], callback: (){})
      ),
    );
  }
}
