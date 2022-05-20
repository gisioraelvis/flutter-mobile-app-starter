import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import '../navigation/routes.dart';
import 'widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
          const SnackBar(content: Text('Submitted')),
        );
        Provider.of<AppState>(context, listen: false).signInState = true;
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 150,
                  child: FlutterLogo(),
                ),
                const SizedBox(height: 16),
                Form(
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
                        // Strip the leading 0 from the phone number e.g 0705640212 to 705640212
                        // Then format the phone number to the international format i.e +254705640212
                        (phoneNumber) {
                          String countryCode = phoneNumber.countryCode;
                          // strip any leading 0's
                          String stripedPhoneNumber =
                              phoneNumber.number.replaceAll(RegExp(r'^0+'), '');
                          formatedCompletePhoneNumber =
                              countryCode + stripedPhoneNumber;
                        },
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
                        "Sign up",
                        () => signUpUser(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () => {
                        context.goNamed(AppScreens.signIn),
                      },
                      child: const Text("SignIn",
                          style: TextStyle(color: Colors.blue)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
