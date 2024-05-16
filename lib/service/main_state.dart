import 'package:flutter/material.dart';
import 'package:train_in/view/pages/home.dart';
import 'package:train_in/view/pages/profile.dart';
import 'package:train_in/view/pages/workouts.dart';

enum MainState {
  home(content: HomePage()),
  training(content: MyWorkoutsPage()),
  profile(content: ProfilePage());

  final Widget content;
  const MainState({required this.content});
}

abstract class MainPageStateManager {
  static final page = ValueNotifier<MainState>(MainState.home);
}