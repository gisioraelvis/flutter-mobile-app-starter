import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _onboarded = false;

  OnboardingState(this.prefs) {
    _onboarded = prefs.getBool("isOnboardingComplete") ?? false;
  }

  bool get getOnboardingState => _onboarded;

  set setOnboardingState(bool value) {
    _onboarded = value;
    prefs.setBool("isOnboardingComplete", value);
    notifyListeners();
  }

  void checkOnboardingState() {
    setOnboardingState = prefs.getBool("isOnboardingComplete") ?? false;
  }
}
