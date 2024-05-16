import 'package:flutter/material.dart';
import 'package:train_in/service/main_state.dart';

class Go {
  static void to(int index, BuildContext c) {
    switch (index) {
      case 0:
        MainPageStateManager.page.value = MainState.home;
        break;
      case 1:
        MainPageStateManager.page.value = MainState.training;
        break;
      case 2:
        MainPageStateManager.page.value = MainState.profile;
        break;
    }
  }
}
