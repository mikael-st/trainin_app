import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:train_in/service/app_initialize.dart';
import 'package:train_in/service/database/database.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/service/dto/exerciseDTO.dart';
import 'package:train_in/service/providers/exercise_provider.dart';
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
  // late Stream<List<Exercise>> _list;

  @override
  void initState() {
    super.initState();
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
        if (!list.hasData) {
          Center(
            child: CircularProgressIndicator(color: Palette.yellow)
          );
        }
        return _content(list.data!);
      }
    );
  }

  Widget _content(List<Exercise> exercises) {
    return Container(
      child: ListView.builder(
        itemCount: /* widget._list.length */ 1,
        itemBuilder: (context, index) {
          print(exercises[index]);
          return ExerciseLabel(
            title: exercises[index].name,
            subtitle: exercises[index].muscle,
            leading: exercises[index].image,
            trealing: Icon(Icons.add, color: Palette.white, size: 20),
            getExercise: () => widget._repository.find(id: exercises[index].id),
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

/* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectExerciseHeader(),
      body: hasBeenInitialize
              ? StreamBuilder(
                  stream: _list,
                  builder: (context, list) {
                    if (!list.hasData) {
                      return Center(
                        child: Text(
                          'Fetching Exercises',
                          style: TextStyle(
                          color: Palette.white
                        ),
                      ),
                    );
                  } else {
                    return _main();
                  }
                })
              : Center(
                child: CircularProgressIndicator(color: Palette.yellow)
              )
      );
  } */

/* Widget _content(Stream<List<Exercise>> exercises) {
    return Container(
      child: ListView.builder(
        controller: _controller,
        itemCount: /* widget._list.length */ 1,
        itemBuilder: (context, index) {
          print(exercises[index]);
          return ExerciseLabel(
            title: exercises[index].name!,
            subtitle: exercises[index].target!,
            leading: exercises[index].image!,
            trealing: Icon(Icons.add, color: Palette.white, size: 20),
          );
        }
      )
    );
  } */