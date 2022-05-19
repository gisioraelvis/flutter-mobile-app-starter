import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

Widget buildPhoneNumberInputField(
    BuildContext context, controller, void Function(PhoneNumber) onChanged) {
  return Column(
    children: [
      IntlPhoneField(
        controller: controller,
        initialCountryCode: 'KE',
        decoration: const InputDecoration(
          hintText: "Enter Phone Number",
          helperText: "e.g 0712345678",
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintStyle: TextStyle(height: 0.5),
        ),
        onChanged: onChanged,
      ),
    ],
  );
}
