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
              return ExerciseModeState.mode.value.view();
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
          value: RepsState(),
          group: ExerciseModeState.mode.value,
          label: 'Repetições',
          onChanged: _onChangeMode
        ),
        CheckMode(
          value: WearinessState(),
          group: ExerciseModeState.mode.value,
          label: 'Exaustão',
          onChanged: _onChangeMode
        ),
      ],
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

// enum ExerciseMode { reps, weariness }

interface class ExerciseMode {
  // late CheckMode checkbox;
  external Widget view();
}

class RepsState implements ExerciseMode {

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

  @override
  view() {
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

  @override
  view() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(3, (index) => _inputWearness(index+1))),
    );
  }
}

class CustomRadio extends StatelessWidget {
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;
  final String label;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.blue : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
