import 'package:flutter/material.dart';
import 'package:train_in/service/repositories/training_repository.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/check_day.dart';

// ignore: must_be_immutable
class CreateTraining extends StatefulWidget {
  late TrainingRepository _repository;
  CreateTraining({super.key, required TrainingRepository repository}){
    _repository = repository;
  }

  @override
  State<CreateTraining> createState() => _CreateTrainingState();
}

class _CreateTrainingState extends State<CreateTraining> {
  List<CheckDay> days = [
    CheckDay(label: 'Dom'),
    CheckDay(label: 'Seg'),
    CheckDay(label: 'Ter'),
    CheckDay(label: 'Quar'),
    CheckDay(label: 'Quin'),
    CheckDay(label: 'Sex'),
    CheckDay(label: 'Sab')
  ];
  
  final textController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palette.items,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8))
      ),
      child: Column(
        children: [
          Container(
            width: 125,
            height: 2,
            margin: const EdgeInsets.only(top: 12, bottom: 30),
            color: Palette.yellow,
          ),
          _form()
        ]
      ),
    );
  }

  Widget _form() {
    for (var element in days) {
      element.state();
    }
    return SizedBox(
      height: 240,
      width: 335,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
              hintText: 'Nome',
              hintStyle: TextStyle(color: Palette.white, fontSize: 12),
              filled: true,
              fillColor: Palette.transparent,
              focusColor: Palette.yellow,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
            ),
            style: TextStyle(color: Palette.white, fontSize: 12),
          ),
          const AreaLabel(text: 'Dias'),
          Days(),
          ElevatedButton(
            onPressed: (){
              final id = widget._repository.create(name: textController.text, days: days.where((value) => value.isChecked == true).map((value) => days.indexOf(value)).toList());
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/training', arguments: widget._repository.find(id));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.transparent,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
      children: days
    );
  }
}