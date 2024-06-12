import 'package:flutter/material.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';

class SearchButton extends StatelessWidget {
  final Function() callback;

  const SearchButton({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        callback.call();
      },
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        padding: const EdgeInsets.all(0),
        alignment: Alignment.centerLeft
      ),
      icon: Icon(TraininIcons.search, color: Palette.white,),
    );
  }
}