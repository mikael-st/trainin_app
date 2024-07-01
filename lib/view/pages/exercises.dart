import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/repositories/exercise_repository.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/select_exercise_header.dart';

// ignore: must_be_immutable
class ExercisesPage extends StatefulWidget {
  bool isScrolling = true;
  late ExerciseRepository _repository;

  ExercisesPage({super.key, required ExerciseRepository repository}){
    _repository = repository;
  }

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  final List<Exercise> _selected = [];

  @override
  void initState() {
    super.initState();
    widget._repository.define();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectExerciseHeader(),
      body: _main()
    );
  }

  Widget _main() {
    return StreamBuilder(
      stream: widget._repository.getLocalExercises(),
      builder: (context, list) {
        if (list.hasData) {
          return _content(list.data!);
        }
        return Center(
          child: CircularProgressIndicator(color: Palette.yellow)
        );
      }
    );
  }

  Widget _content(List<Exercise> exercises) {
    return Container(
      child: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ExerciseLabel(
            exercise: exercises[index],
            trealing: Icon(Icons.add, color: Palette.white, size: 24),
            callback: () => {_selected.add(exercises[index]), print(_selected)},
          );
        }
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}