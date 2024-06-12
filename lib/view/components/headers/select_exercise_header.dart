import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/back_btn.dart';
import 'package:train_in/view/components/actions/done_btn.dart';
import 'package:train_in/view/components/actions/search_btn.dart';

class SelectExerciseHeader extends StatefulWidget implements PreferredSizeWidget {
  const SelectExerciseHeader({super.key});

  @override
  State<SelectExerciseHeader> createState() => _SelectExerciseHeaderState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SelectExerciseHeaderState extends State<SelectExerciseHeader> {

  bool isActivated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        backgroundColor: Palette.items,
        leading: const BackBtn(),
        title: isActivated ? _searchBar() : Container(),
        actions: [
          SearchButton(
            callback: () {
              setState(() {
                isActivated = !isActivated;
              });
            },
          ),
          DoneButton()
        ],
      )
    );
  }

  Widget _searchBar() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: 'Buscar',
        hintStyle: TextStyle(color: Palette.white),
        filled: false,
        border: InputBorder.none
      ),
    );
  }
}