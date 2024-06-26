import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:train_in/service/dto/exerciseDTO.dart';
import 'package:train_in/view/assets/palette.dart';

class ExerciseInfosModal extends StatelessWidget {
  // final ExerciseDTO exercise;

  const ExerciseInfosModal({super.key, /* required this.exercise */});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: _header(context, text: 'name'/* exercise.name! */),
      content: _content(
        target: 'target'/* exercise.target! */,
        equipment: 'equipment' /* exercise.equipment! */,
        instructions: ['1', '2', '3'] /* exercise.instructions! */,
        image: Uint8List(0) /* exercise.image! */
      ),
      backgroundColor: Palette.items,
    );
  }

  _header(BuildContext c, { required String text }) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide( color: Palette.white, width: 2))
      ),
      child: Row(
        children: [
          Text(text, style: TextStyle( color: Palette.white )),
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
    required List<dynamic> instructions,
    required Uint8List image
  }) {
    return Container(
      child: Column(
        children: [
          _image(image),
          _item(label: 'Target', value: target),
          _item(label: 'Equipment', value: equipment),
        ]
      ),
    );
  }

  Widget _item({ required String label, required String value }) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Palette.yellow,
          fontWeight: FontWeight.bold
        ),
        children: [
          TextSpan(text: label),
          TextSpan(text: value, style: TextStyle( color: Palette.white, fontWeight: FontWeight.normal ))
        ]
      )
    );
  }

  Widget _image(Uint8List bits) {
    return Container(
      height: 183,
      decoration: BoxDecoration(
          image: DecorationImage(image: MemoryImage(bits), fit: BoxFit.cover)),
    );
  }
}