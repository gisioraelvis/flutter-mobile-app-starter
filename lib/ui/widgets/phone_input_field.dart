import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneNumberInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const PhoneNumberInputField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<PhoneNumberInputField> createState() => _PhoneNumberInputFieldState();
}

class _PhoneNumberInputFieldState extends State<PhoneNumberInputField> {
  @override
  Widget build(BuildContext context) {
    String completePhoneNumber;
    String countryCode;
    // take controler and strip any leading 0's then set controller to country code + stripped number

    return Column(
      children: [
        IntlPhoneField(
          controller: widget.controller,
          initialCountryCode: 'KE',
          decoration: const InputDecoration(
            hintText: "Enter Phone Number",
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
          onChanged: (value) {
            // strip any leading 0's
            countryCode = value.countryCode;
            completePhoneNumber =
                countryCode + value.number.replaceAll(RegExp(r'^0+'), '');
            print(completePhoneNumber);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            Text('e.g. 0781234567'),
          ],
        )
      ],
    );
  }
}
