import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/area_label.dart';
import 'package:train_in/components/auto_size_textfield.dart';
import 'package:train_in/components/button.dart';
import 'package:train_in/components/check_mode.dart';
import 'package:train_in/components/headers/edit_exercise_header.dart';

class EditExercisePage extends StatefulWidget {

  const EditExercisePage({super.key});

  @override
  State<EditExercisePage> createState() => _EditExercisePageState();
}

class _EditExercisePageState extends State<EditExercisePage> {


  final List<CheckMode> _modes = [
    CheckMode(
      value: RepsState(),
      group: ExerciseModeState.mode.value,
      label: 'Repetições',
      onChanged: ,
      callback: )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EditExerciseHeader(),
      body: _main(),
    );
  }

  Widget _main() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: SingleChildScrollView(
        child: Column(children: [
          _modesArea(),
          AnimatedBuilder(
            animation: ExerciseModeState.mode,
            builder: (context, child) {
              return ExerciseModeState.mode.value.change();
            }
          ),
          AreaLabel(text: 'Músculos acionados')
        ]),
      ));
  }

  Widget _modesArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _modes,
    );
  }
}

class ExerciseModeState {
  static final mode = ValueNotifier<ExerciseMode>(RepsState());
}

class ExerciseSerieManager {
  int total = 3;
  
  addSerie() {
    total += 1;
  }

  Serie() {
    total += 1;
  }
}

interface class ExerciseMode {
  // late CheckMode checkbox;
  external Widget change();
}

class RepsState implements ExerciseMode {

  Widget _inputFields(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$indexº', style: TextStyle(color: Palette.white)),
        AutoSizeTextField(label: 'Reps'),
        Text('X', style: TextStyle(color: Palette.white)),
        AutoSizeTextField(label: 'Kg')
      ],
    );
  }

  @override
  change() {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 250,
        // height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(3, (index) => _inputFields(index + 1))),
    ));
  }
}

class WearinessState implements ExerciseMode {

  Widget _inputWearness(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$indexº', style: TextStyle(color: Palette.white)),
        AutoSizeTextField(label: 'Kg')
      ],
    );
  }

  @override
  change() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) => _inputWearness(index+1))),
    );
  }
}