import 'dart:developer';

import 'package:flutter/widgets.dart';

class IndexProvider extends ChangeNotifier {
  int currentindex = 0;
  bool triggerNavigation = false;

  void updateCurrentIndex(int index) {
    currentindex = index;
    notifyListeners();
  }

  void updateTrigerNavigation(bool update) {
    triggerNavigation = update;

    notifyListeners();
    log('triggered Navigation is $triggerNavigation');
    Future.delayed(const Duration(seconds: 1), () {
      triggerNavigation = false;
      notifyListeners();
      log('triggered Navigation is $triggerNavigation');
    });
  }
}
