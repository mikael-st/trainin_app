import 'package:flutter/material.dart';
import 'package:train_in/assets/globals.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/components/header.dart';
import 'package:train_in/components/navbar.dart';
import 'package:train_in/components/training_box.dart';
import 'package:train_in/components/training_label.dart';


class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(),
        body: Main(),
        bottomNavigationBar: NavBar(),
      );
  }

  Widget Main() {
    return Container(
      alignment: Alignment.topCenter,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Label(text: 'Treino de hoje'),
            TrainingBox(),
            Label(text: 'Restrospectiva'),
            Retrospective()
          ],
        ),
      ),
    );
  }

  Widget Label({required String text}) {
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

  Widget Retrospective() {
    return Column(
      children: List.generate(5, (index) => TrainingLabel()),
    );
  }


  Color setLabelColor(int day) {
    if (day == Globals.getToday()) {
      return Palette.white;
    } else {
      return Palette.details;
    }
  }
}
