import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class AreaLabel extends StatelessWidget {
  final String text;
  const AreaLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, bottom: 10, top: 15),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(color: Palette.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                alignment: Alignment.topCenter,
                height: 2,
                color: Palette.yellow,
            )
          )
        ],
      ),
    );
  }
}