import 'package:flutter/material.dart';

import '../../colors.dart';

Widget buildButton(BuildContext context, text, onPressed) {
  String _text = text ?? '';
  return SizedBox(
    height: 55,
    child: MaterialButton(
      color: rwColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Text(
        _text,
        style: const TextStyle(color: Colors.white),
      ),
      onPressed: () async {
        await onPressed();
      },
    ),
  );
}
