import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/pages/edit_exercise.dart';

class CheckMode extends StatelessWidget {
  final ExerciseMode value;
  final ExerciseMode group;
  // final Function() callback;
  final ValueChanged<ExerciseMode?> onChanged;
  final String label;

  const CheckMode({super.key, required this.value, required this.group, required this.label, required this.onChanged, /* required this.callback */});

  @override
  Widget build(BuildContext context) {
    final bool checked = value == group;
    return InkWell(
      onTap: () {
        onChanged(value);
        print('value: $value\ngroup: $group\nis checked: $checked');
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: checked ? Palette.yellow : Palette.details,
          borderRadius: BorderRadius.circular(4)
        ),
        child: Text(label, style: TextStyle(color: Palette.white)),
      ),
    );
  }
}

// // ignore: must_be_immutable
// class CheckMode extends StatefulWidget {
//   final String label;
//   final Function() callback;
//   bool checked = false;
//   CheckMode({super.key, required this.label, required this.callback});

//   changeValue(bool value) {
//     checked = value;
//   }

//   @override
//   State<CheckMode> createState() => _CheckModeState();
// }

// class _CheckModeState extends State<CheckMode> {
  
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         widget.callback.call();
//         setState(() { 
//           if (widget.checked != true) {
//             widget.changeValue(true);
//           }
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         decoration: BoxDecoration(
//           color: widget.checked ? Palette.yellow : Palette.details,
//           borderRadius: BorderRadius.circular(4)
//         ),
//         child: Text(widget.label, style: TextStyle(color: Palette.white)),
//       ),
//     );
//   }
// }