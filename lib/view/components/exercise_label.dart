import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/view/assets/palette.dart';

class ExerciseLabel extends StatelessWidget {
  // final String title, subtitle;
  final Icon? trealing;
  // final Uint8List? leading;
  final Exercise exercise;
  final Function() callback;
  const ExerciseLabel({
    super.key,
    required this.exercise,
    required this.callback,
    this.trealing,
    // required this.title,
    // required this.subtitle,
    // required this.getExercise,
    // this.leading
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // show modal page with infos about the exercise
        // final result = getExercise.call();
        // showDialog(context: context, builder: (BuildContext context) {
        //   return ExerciseInfos(exercise: exercise);
        // });
        Navigator.of(context).pushNamed('/exercise_info', arguments: exercise);
      },
      onLongPress: () {
        // show options
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        // width: 330,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            color: Palette.items, borderRadius: BorderRadius.circular(8)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            _leading(),
            _text(),
          ]),
          _trealing()
        ]),
      ),
    );
  }

  Widget _leading() {
    return ConstrainedBox(
        constraints: const BoxConstraints(
            minHeight: 68, maxHeight: 68, minWidth: 68, maxWidth: 68),
        child: /* leading */exercise.image != Uint8List(0) ? _image(exercise.image) : _undefinedImage());
  }

  Widget _text() {
    return Container(
      width: 250,
      padding: const EdgeInsets.only(left: 10),
      child:
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(exercise.name, overflow: TextOverflow.ellipsis, style: TextStyle( color: Palette.white, fontSize: 14, fontWeight: FontWeight.bold)),
          Text(exercise.muscle, style: TextStyle(color: Palette.yellow, fontSize: 12))
        ]
      )
    );
  }

  Widget _trealing() {
    return IconButton(
      onPressed: () {
        callback.call();
      },
      icon: trealing ?? Container(),
      style: IconButton.styleFrom(
        padding: const EdgeInsets.only(right: 10),
        backgroundColor: Palette.transparent
      ),
    );
  }

  Widget _image(Uint8List bits) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: MemoryImage(bits), fit: BoxFit.cover)),
    );
  }

  Widget _undefinedImage() {
    return Container(
      color: Palette.light_gray,
    );
  }
}
