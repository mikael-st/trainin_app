import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/check_day.dart';

// ignore: must_be_immutable
class CreateTraining extends StatefulWidget {
  CreateTraining({super.key});

  @override
  State<CreateTraining> createState() => _CreateTrainingState();
}

class _CreateTrainingState extends State<CreateTraining> {
  List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.items,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
      ),
      child: Column(
        children: [
          Container(
            width: 125,
            height: 2,
            margin: EdgeInsets.only(top: 12, bottom: 30),
            color: Palette.yellow,
          ),
          _form()
        ]
      ),
    );
  }

  Widget _form() {
    return Container(
      height: 240,
      width: 335,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              hintText: 'Nome',
              hintStyle: TextStyle(color: Palette.white, fontSize: 12),
              filled: true,
              fillColor: Palette.transparent,
              focusColor: Palette.yellow,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
            ),
            style: TextStyle(color: Palette.white, fontSize: 12),
          ),
          AreaLabel(text: 'Dias'),
          Days(),
          ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Palette.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
              ),
              child: Text('Adicionar', style: TextStyle(color: Palette.yellow, fontWeight: FontWeight.bold)
              )
            )
        ]
      )
    );
  }

  Widget Days() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: days.map((d) => CheckDay(label: d)).toList()
    );
  }
}