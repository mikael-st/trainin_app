import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/button.dart';

class TrainingBox extends StatelessWidget {
  const TrainingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 185,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/chest-training.png'),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Palette.items, Palette.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter
          )
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Treino', style: TextStyle(color: Palette.white, fontWeight: FontWeight.bold)),
            Button(
              content: 'Começar',
              padding: EdgeInsets.symmetric(vertical: 8),
              callback: (){},
            )
          ]),
      ),
    );
  }
}
