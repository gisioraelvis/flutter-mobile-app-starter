import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class SignInState extends ChangeNotifier {
  final SharedPreferences prefs;
  bool _signedIn = false;

  SignInState(this.prefs) {
    _signedIn = prefs.getBool(SIGNIN_KEY) ?? false;
  }

  bool get signedIn => _signedIn;
  set signedIn(bool value) {
    _signedIn = value;
    prefs.setBool(SIGNIN_KEY, value);
    notifyListeners();
  }

  void checkSignedIn() {
    signedIn = prefs.getBool(SIGNIN_KEY) ?? false;
  }
}
