import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/exercise_model.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseInfos extends StatelessWidget {
  // final Exercise exercise;

  const ExerciseInfos({super.key, /* required this.exercise */});

  @override
  Widget build(BuildContext context) {
    final Exercise exercise = ModalRoute.of(context)?.settings.arguments as Exercise;
    return Scaffold();
  }

  _header(BuildContext c, { required String text }) {
    return Container();
  }

  Widget _content({
    required String target,
    required String equipment,
    required List<String> instructions,
    required Uint8List image
  }) {
    return Container();
  }

  Widget _item({ required String label, required String value }) {
    return Container();
  }

  Widget _instructions(List<String> instructions) {
    return Container();
  }

  Widget _image(Uint8List bits) {
    return Container();
  }

  Widget _button() {
    return Container();
  }
}
/* 
_main() {
  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Palette.items,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context, text: exercise.name),
            _content(
              target: exercise.muscle,
              equipment: exercise.equipment,
              instructions: exercise.instructions,
              image: exercise.image
            ),
          ],
        ),
      );
} */

/* _header(BuildContext c, { required String text }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide( color: Palette.yellow, width: 2))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text, style: TextStyle( color: Palette.white, fontWeight: FontWeight.bold, fontSize: 16 )),
          IconButton(
            onPressed: () => Navigator.of(c).pop(),
            icon: Icon(Icons.close, color: Palette.white)
          )
        ],
      ),
    );
  }

  Widget _content({
    required String target,
    required String equipment,
    required List<String> instructions,
    required Uint8List image
  }) {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(image),
          _item(label: 'Target', value: target),
          _item(label: 'Equipment', value: equipment),
          _instructions(instructions),
          _button()
        ]
      ),
    );
  }

  Widget _item({ required String label, required String value }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Palette.yellow,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.montserrat().fontFamily
        ),
        children: [
          TextSpan(text: '$label: '),
          TextSpan(text: value, style: TextStyle( color: Palette.white, fontWeight: FontWeight.normal ))
        ]
      )
    );
  }

  Widget _instructions(List<String> instructions) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Instructions:', style: TextStyle( color: Palette.yellow, fontWeight: FontWeight.bold )),
        ],
      ),
    );
  }

  Widget _image(Uint8List bits) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(image: MemoryImage(bits), fit: BoxFit.cover)),
    );
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () => print('hi'),
        child: Text('Adicionar', style: TextStyle( color: Palette.white, fontWeight: FontWeight.bold )),
        style: ElevatedButton.styleFrom(
          backgroundColor: Palette.yellow
        ),
      ),
    );
  } */