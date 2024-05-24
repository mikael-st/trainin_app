import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/back_btn.dart';
import 'package:train_in/view/components/actions/done_btn.dart';

class EditExerciseHeader extends StatelessWidget implements PreferredSizeWidget {
  const EditExerciseHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        backgroundColor: Palette.items,
        leading: const BackBtn(),
        actions: const [DoneButton()],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            margin: const EdgeInsets.only(left: 22, right: 22, top: 30, bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _exerciseInfos()
              ],
            ),
          ))
      )
    );
  }

  Widget _exerciseInfos() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Nome', style: TextStyle(color: Palette.white, fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.info, size: 16, color: Palette.white),
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(0),
              )
            )
          ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(140);
}