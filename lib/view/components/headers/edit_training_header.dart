import 'package:flutter/material.dart';
import 'package:train_in/service/database/models/training_model.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/back_btn.dart';
import 'package:train_in/view/components/actions/done_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/check_day.dart';

class EditTrainingHeader extends StatefulWidget implements PreferredSizeWidget {
  final String trainingName;
  final List<int> daysValues;
  EditTrainingHeader({super.key, required this.daysValues, required this.trainingName});

  @override
  State<EditTrainingHeader> createState() => _EditTrainingHeaderState();
  
  @override
  Size get preferredSize => const Size.fromHeight(250);
}

class _EditTrainingHeaderState extends State<EditTrainingHeader> {
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
  void initState() {
    super.initState();
    textController.text = widget.trainingName;
    widget.daysValues.map(
      (index) => days[index].isChecked = true
    ).toList();
  }

  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 250,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
      backgroundColor: Palette.items,
      leading: const BackBtn(),
      actions: const [DoneButton()],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
              height: 180,
              margin: const EdgeInsets.only(top: 8, bottom: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_input(), const AreaLabel(text: 'Dias'), _days()],
              ))),
    ));
  }

  Widget _input() {
    return TextField(
      controller: textController,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 12),
          hintText: 'Nome',
          hintStyle: TextStyle(color: Palette.white, fontSize: 14),
          filled: true,
          fillColor: Palette.transparent,
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Palette.yellow)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Palette.yellow))
        ),
      style: TextStyle(color: Palette.white, fontSize: 12),
    );
  }

  Widget _days() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: days
    );
  }
}
