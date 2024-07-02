import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

//ignore: must_be_immutable
class CheckDay extends StatefulWidget {
  final String label;
  bool isChecked = false;
  CheckDay({super.key, required this.label});

  @override
  State<CheckDay> createState() => _CheckDayState();
  
  void state() {
    print('label: $label is checked: $isChecked');
  }
}

class _CheckDayState extends State<CheckDay> {  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _checkbox(),
        Text(widget.label, style: TextStyle(color: Palette.white, fontSize: 12),)
      ],
    );
  }

  Widget _checkbox() {
    return InkWell(
      onTap: () => setState(() {
        widget.isChecked = !widget.isChecked;
      }),
      child: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(
          color: widget.isChecked ? Palette.yellow : Palette.details,
          borderRadius: BorderRadius.circular(4)
        ),
      ),
    );
  }
}