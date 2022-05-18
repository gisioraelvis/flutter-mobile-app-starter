import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../utils/validators.dart';

class PasswordInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController passwordController;
  const PasswordInputField(
      {Key? key, required this.hintText, required this.passwordController})
      : super(key: key);
  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  var hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: rwColor,
      obscureText: hidePassword,
      controller: widget.passwordController,
      validator: (passwordController) =>
          Validators.isValidPassword(passwordController),
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
        hintText: widget.hintText,
        hintStyle: const TextStyle(height: 0.5),
        suffix: InkWell(
          onTap: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          child: Icon(
            hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}

class ConfirmPasswordInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  const ConfirmPasswordInputField({
    Key? key,
    required this.hintText,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);
  @override
  State<ConfirmPasswordInputField> createState() =>
      _ConfirmPasswordInputField();
}

class _ConfirmPasswordInputField extends State<ConfirmPasswordInputField> {
  var hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: rwColor,
      obscureText: hidePassword,
      controller: widget.confirmPasswordController,
      validator: (confirmPasswordController) => Validators.confirmPasswordMatch(
        widget.passwordController.text,
        confirmPasswordController,
      ),
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
        hintText: widget.hintText,
        hintStyle: const TextStyle(height: 0.5),
        suffix: InkWell(
          onTap: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          child: Icon(
            hidePassword ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
