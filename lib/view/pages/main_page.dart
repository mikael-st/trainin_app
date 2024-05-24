import 'package:flutter/material.dart';
import 'package:train_in/service/main_state.dart';
import 'package:train_in/view/components/navbar.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: MainPageStateManager.page,
        builder: (context, child) => MainPageStateManager.page.value.content
      ),
      bottomNavigationBar: const NavBar(),
    );
  }
}