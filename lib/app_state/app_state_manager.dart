import 'dart:async';

import 'package:flutter/material.dart';

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;

  bool _onboardingComplete = false;

  // 5
  bool get isInitialized => _initialized;
  bool get isOnboardingComplete => _onboardingComplete;

  void initializeApp() {
    // 7
    Timer(
      const Duration(milliseconds: 2000),
      () {
        // 8
        _initialized = true;
        // 9
        notifyListeners();
      },
    );
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }
}
