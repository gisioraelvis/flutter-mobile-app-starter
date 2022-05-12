import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _signedIn = false;

  SignInState(this.prefs) {
    _signedIn = prefs.getBool("isSignedIn") ?? false;
  }

  bool get signedIn => _signedIn;
  set signedIn(bool value) {
    _signedIn = value;
    prefs.setBool("isSignedIn", value);
    notifyListeners();
  }

  void checkSignedIn() {
    signedIn = prefs.getBool("isSignedIn") ?? false;
  }
}
