import 'package:flutter/material.dart';
import 'package:train_in/assets/palette.dart';
import 'package:train_in/assets/trainin_icons.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Palette.yellow, width: 2))),
        child: BottomNavigationBar(
          onTap: (index) => {print(index) /* Go.to(index, context) */},
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(TraininIcons.dumbell),
              label: 'Treino',
            ),
            BottomNavigationBarItem(
              icon: Icon(TraininIcons.user, size: 20),
              label: 'Perfil',
            )
          ],
          selectedFontSize: 10,
          unselectedFontSize: 10,
          unselectedItemColor: Palette.white,
          fixedColor: Palette.white,
          backgroundColor: Palette.items,
          type: BottomNavigationBarType.fixed,
        ));
  }
}
