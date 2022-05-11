import 'package:flutter/material.dart';

import '../../colors.dart';

Widget buildTextfield(String hintText) {
  return TextField(
    cursorColor: rwColor,
    decoration: InputDecoration(
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.blue,
          width: 1.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blue),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(height: 0.5),
    ),
  );
}
