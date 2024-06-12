import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:train_in/service/dto/exercise.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/exercise_label.dart';
import 'package:train_in/view/components/headers/select_exercise_header.dart';

// ignore: must_be_immutable
class ExercisesPage extends StatefulWidget {
  late List<ExerciseDTO> _list;
  bool isScrolling = true;

  ExercisesPage({super.key, required list}){
    _list = list;
  }

  @override
  State<ExercisesPage> createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SelectExerciseHeader(),
      body: _main(),
    );
  }

  Widget _main() {
    return _content(widget._list);
  }

  Widget _content(List<ExerciseDTO> exercises) {
    return Container(
      child: ListView.builder(
        controller: _controller,
        itemCount: 1,
        itemBuilder: (context, index) {
          return ExerciseLabel(
            title: exercises[index].name!,
            subtitle: exercises[index].target!,
            leading: exercises[index].image,
            trealing: Icon(Icons.add, color: Palette.white, size: 20),
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