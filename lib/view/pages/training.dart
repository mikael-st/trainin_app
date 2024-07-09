import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/add_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/training_header.dart';


class TrainingPage extends StatelessWidget {
  const TrainingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<Training> stream = ModalRoute.of(context)?.settings.arguments as Stream<Training>;
    return StreamBuilder(
      stream: stream,
      builder: (context, training) {
        if (training.hasData) {
          return _content(context, training: training.data!);
        }
        return Center(
          child: CircularProgressIndicator(color: Palette.yellow),
        );
      }
    );
  }

  Widget _content(BuildContext context ,{required Training training}) {
    return Scaffold(
      appBar: TrainingHeader(infos: training),
      body: _main(training),
      floatingActionButton: AddButton(callback: () => Navigator.of(context).pushNamed('/exercises', arguments: training)),
    );
  }

  Widget _main(Training training) {
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
            training.exercises.isEmpty ? _noExercises() : _exercises(training.exercises)
          ],
        ),
      ),
    );
  }

  Widget _noExercises() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Text('Este treino não possui exercícios.', style: TextStyle(color: Palette.white)),
    );
  }

  Widget _exercises(List<Exercise> exercises) {
    return Column(
      children: List.generate(
        exercises.length,
        (index) => ExerciseLabel(exercise: exercises[index], callback: (){})),
    );
  }
}
