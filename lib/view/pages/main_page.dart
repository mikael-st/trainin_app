import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:train_in/view/components/headers/header.dart';
import 'package:train_in/view/components/navbar.dart';
import 'package:train_in/view/components/training_label.dart';
import 'package:train_in/view/pages/home.dart';
import 'package:train_in/view/pages/profile.dart';
import 'package:train_in/view/pages/training.dart';

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: AnimatedBuilder(
        animation: MainPageStateManager.page,
        builder: (context, child) => MainPageStateManager.page.value.view
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}

enum MainPage {
  home(view: HomePage()),
  training(view: TrainingPage()),
  profile(view: ProfilePage());

  final Widget view;
  const MainPage({required this.view});
}

abstract class MainPageStateManager {
  static final page = ValueNotifier<MainPage>(MainPage.home);
}