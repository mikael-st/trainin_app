import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';

class CheckDay extends StatefulWidget {
  final String label;
  const CheckDay({super.key, required this.label});

  @override
  State<CheckDay> createState() => _CheckDayState();
}

class _CheckDayState extends State<CheckDay> {
  bool _isChecked = false;
  
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
        _isChecked = !_isChecked;
      }),
      child: Container(
        width: 32, height: 32,
        decoration: BoxDecoration(
          color: _isChecked ? Palette.yellow : Palette.details,
          borderRadius: BorderRadius.circular(4)
        ),
      ),
    );
  }
}