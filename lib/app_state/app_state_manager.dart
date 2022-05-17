import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class AppState with ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  bool _initialized = false;
  bool _onboarding = false;
  bool _signInState = false;

  AppState(this.sharedPreferences);

  bool get initialized => _initialized;
  bool get onboarding => _onboarding;
  bool get signInState => _signInState;

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set onboarding(bool value) {
    sharedPreferences.setBool(ONBOARDING_KEY, value);
    _onboarding = value;
    notifyListeners();
  }

  set signInState(bool state) {
    sharedPreferences.setBool(SIGNIN_KEY, state);
    _signInState = state;
    print("----set signInState: $state ----");
    notifyListeners();
  }

  Future<void> onAppStart() async {
    _onboarding = sharedPreferences.getBool(ONBOARDING_KEY) ?? false;
    _signInState = sharedPreferences.getBool(SIGNIN_KEY) ?? false;

    print("---initialized: $_initialized---");
    print("---onboarding: $_onboarding---");
    print("---signInState: $_signInState---");

    // This is just to demonstrate the splash screen is working.
    // In real-life applications, it is not recommended to interrupt the user experience by doing such things.

    await Future.delayed(const Duration(seconds: 5));
    _initialized = true;
    notifyListeners();
  }
}
