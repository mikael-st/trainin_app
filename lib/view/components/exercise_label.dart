import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class ExerciseLabel extends StatelessWidget {
  final String title, subtitle;
  final Icon? trealing;
  final Uint8List? leading;
  const ExerciseLabel(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trealing,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // show modal page with infos about the exercise
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
        child: leading != null ? _image(leading!) : _undefinedImage());
  }

  Widget _text() {
    return Container(
            padding: const EdgeInsets.only(left: 10),
            // clipBehavior: Clip.hardEdge,
            child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  title,
                  style: TextStyle(
                      color: Palette.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold))),
              Text(subtitle,
                  style: TextStyle(color: Palette.yellow, fontSize: 12))
            ]));
  }

  Widget _trealing() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: trealing ?? Container(),
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
