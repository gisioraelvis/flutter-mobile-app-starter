import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/routes.dart';
import 'widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final String? email;
  final String? password;

  const SignUpScreen({
    Key? key,
    this.email,
    this.password,
  }) : super(key: key);

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
          'email: ${_emailController.text}, '
          'phone: ${_phoneNumberController.text}, '
          'password: ${_passwordController.text}',
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Processing Data')),
        );
        // Provider.of<AppState>(context, listen: false).signInState = true;
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
                      PhoneNumberInputField(
                        hintText: "Enter Phone Number",
                        controller: _phoneNumberController,
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
