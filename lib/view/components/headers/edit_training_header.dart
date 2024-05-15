import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/back_btn.dart';
import 'package:train_in/view/components/actions/done_btn.dart';
import 'package:train_in/view/components/area_label.dart';
import 'package:train_in/view/components/check_day.dart';

// ignore: must_be_immutable
class EditTrainingHeader extends StatelessWidget
    implements PreferredSizeWidget {
  EditTrainingHeader({super.key});

  List<String> days = ['Dom', 'Seg', 'Ter', 'Quar', 'Quin', 'Sex', 'Sab'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      toolbarHeight: 250,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
      backgroundColor: Palette.items,
      leading: BackBtn(),
      actions: [DoneButton()],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: Container(
              height: 180,
              margin: EdgeInsets.only(top: 8, bottom: 20, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [_input(), AreaLabel(text: 'Dias'), _days()],
              ))),
    ));
  }

  Widget _input() {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12),
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
        children: days.map((d) => CheckDay(label: d)).toList());
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(250);
}
