import 'package:flutter/material.dart';
import 'package:train_in/service/go_to.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';

class NavBar extends StatefulWidget {

  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Palette.yellow, width: 2))),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(
                color: Palette.white,
                fontSize: 12,
              )
            )
          ),
          child: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
            Go.to(value, context);
          },
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_filled, color: Palette.white),
              label: 'Início',
            ),
            NavigationDestination(
              icon: Icon(TraininIcons.dumbell, color: Palette.white),
              label: 'Treino',
            ),
            NavigationDestination(
              icon: Icon(TraininIcons.user, size: 20, color: Palette.white),
              label: 'Perfil',
            )
          ],
          selectedIndex: index,
          backgroundColor: Palette.items,
          indicatorColor: Palette.yellow,
        )),
      );
  }
}
