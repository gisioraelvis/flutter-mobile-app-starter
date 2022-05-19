import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? formatedCompletePhoneNumber;
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _phoneNumberController = TextEditingController();
    final _passwordController = TextEditingController();
    final _confirmPasswordController = TextEditingController();

    void signUpUser(BuildContext context) {
      if (_formKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        // print email, phoneNumber and password
        print(
          '{email: ${_emailController.text},\n'
          'phone: $formatedCompletePhoneNumber,\n'
          'password: ${_passwordController.text}}',
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saved')),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Text('E', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildEmailInputField(
                      'Enter Email',
                      _emailController,
                    ),
                    const SizedBox(height: 16),
                    buildPhoneNumberInputField(
                      context,
                      _phoneNumberController,
                    ),
                    const SizedBox(height: 16),
                    PasswordInputField(
                      hintText: 'Enter Password',
                      passwordController: _passwordController,
                    ),
                    const SizedBox(height: 16),
                    ConfirmPasswordInputField(
                      hintText: 'Confirm Password',
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
                    ),
                    const SizedBox(height: 16),
                    buildButton(
                      context,
                      "Update",
                      () => signUpUser(context),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPhoneNumberInputField(BuildContext context, controller) {
    String stripedPhoneNumber;
    String countryCode;

    return Column(
      children: [
        IntlPhoneField(
          controller: controller,
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
          onChanged: (phoneNumber) {
            countryCode = phoneNumber.countryCode;
            // strip any leading 0's
            stripedPhoneNumber =
                phoneNumber.number.replaceAll(RegExp(r'^0+'), '');
            formatedCompletePhoneNumber = countryCode + stripedPhoneNumber;
          },
        ),
      ],
    );
  }
}
