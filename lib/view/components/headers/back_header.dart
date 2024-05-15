import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/components/actions/back_btn.dart';
import 'package:train_in/view/components/actions/options_btn.dart';

// ignore: must_be_immutable
class BackHeader extends StatelessWidget implements PreferredSizeWidget {
  BackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
        backgroundColor: Palette.items,
        leading: BackBtn(),
        actions: [OptionsButton()],
      ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}