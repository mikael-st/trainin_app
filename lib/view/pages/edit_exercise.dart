import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/auto_size_textfield.dart';
import 'package:train_in/view/components/button.dart';
import 'package:train_in/view/components/check_mode.dart';
import 'package:train_in/view/components/headers/edit_exercise_header.dart';

class EditExercisePage extends StatefulWidget {

  const EditExercisePage({super.key});

  @override
  State<EditExercisePage> createState() => _EditExercisePageState();
}

class _EditExercisePageState extends State<EditExercisePage> {
  
  void _onChangeMode(ExerciseMode? value) {
    setState(() {
      ExerciseModeState.mode.value = value!;
    });
  }

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
              return ExerciseModeState.mode.value.view;
            }
          ),
          AreaLabel(text: 'Músculos acionados')
        ]),
      ));
  }

  Widget _modesArea() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      // children: _modes,
      children: [
        CheckMode(
          value: ExerciseMode.reps,
          group: ExerciseModeState.mode.value,
          label: 'Repetições',
          onChanged: _onChangeMode
        ),
        CheckMode(
          value: ExerciseMode.weariness,
          group: ExerciseModeState.mode.value,
          label: 'Exaustão',
          onChanged: _onChangeMode
        ),
      ],
    );
  }
}

class ExerciseModeState {
  static final mode = ValueNotifier<ExerciseMode>(ExerciseMode.reps);
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

enum ExerciseMode { 
  reps (view: RepsView()),
  weariness(view: WearinessView());

  final Widget view;
  const ExerciseMode({required this.view});
}

class RepsView extends StatefulWidget {
  const RepsView({super.key});

  @override
  State<RepsView> createState() => _RepsViewState();
}

class _RepsViewState extends State<RepsView> {
  final ExerciseSerieManager manager = ExerciseSerieManager();

  Widget _inputFields(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('$indexº', style: TextStyle(color: Palette.white)),
          AutoSizeTextField(label: 'Reps'),
          Text('X', style: TextStyle(color: Palette.white)),
          AutoSizeTextField(label: 'Kg')
        ],
      )
    );
  }

  Widget _series() {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(manager.total, (index) => _inputFields(index + 1))
        ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 250,
        child: Column(
          children: [
            _series(),
            Button(
              content: 'Adicionar série',
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              callback: () {
                setState(() {
                  manager.addSerie();
                });
              }
            )
          ],
        ),
    ));
  }
}

class WearinessView extends StatefulWidget {
  const WearinessView({super.key});

  @override
  State<WearinessView> createState() => _WearinessStateState();
}

class _WearinessStateState extends State<WearinessView> {
  final ExerciseSerieManager manager = ExerciseSerieManager();

  Widget _inputFields(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('$indexº', style: TextStyle(color: Palette.white)),
          AutoSizeTextField(label: 'Kg')
        ],
      )
    );
  }

  Widget _series() {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(manager.total, (index) => _inputFields(index+1))),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        width: 250,
        child: Column(
          children: [
            _series(),
            Button(
              content: 'Adicionar série',
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              callback: () {
                setState(() {
                  manager.addSerie();
                });
              }
            )
          ],
        ),
    ));
  }
}