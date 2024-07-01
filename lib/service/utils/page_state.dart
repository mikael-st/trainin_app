import 'package:flutter/material.dart';

enum PageState {
  home     (page: PageValues(route: '/home', index: 0)),
  training (page: PageValues(route: '/my_workouts', index: 1)),
  profile  (page: PageValues(route: '/profile', index: 2));

  final PageValues page;
  const PageState({required this.page});
}

abstract class PageStateManager {
  static final current = ValueNotifier<PageState>(PageState.home);
  static PageState previous = current.value;
}

class PageValues {
  final String route;
  final int index;

  const PageValues({required this.route, required this.index});
}