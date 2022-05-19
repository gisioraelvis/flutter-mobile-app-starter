import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../utils/validators.dart';

Widget buildEmailInputField(
    String hintText, TextEditingController emailController) {
  return TextFormField(
    cursorColor: rwColor,
    keyboardType: TextInputType.emailAddress,
    controller: emailController,
    validator: (emailController) => Validators.isValidEmail(emailController),
    decoration: InputDecoration(
      prefixIcon: const Icon(Icons.email),
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
