import 'package:flutter/material.dart';
import 'package:train_in/service/utils/page_state.dart';
import 'package:train_in/view/assets/palette.dart';
import 'package:train_in/view/assets/trainin_icons.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<PageState> pages = [PageState.home, PageState.training, PageState.profile];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Palette.yellow, width: 2))),
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: WidgetStateProperty.all(
              TextStyle(
                color: Palette.white,
                fontSize: 12,
              )
            )
          ),
          child: NavigationBar(
          onDestinationSelected: (value) {
            PageStateManager.previous = PageStateManager.current.value;
            PageStateManager.current.value = pages[value];
            Navigator.of(context).pushNamed(PageStateManager.current.value.page.route);
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
          selectedIndex: PageStateManager.current.value.page.index,
          backgroundColor: Palette.items,
          indicatorColor: Palette.yellow,
        )),
      );
  }
}
