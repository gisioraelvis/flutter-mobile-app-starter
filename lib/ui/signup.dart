import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 150,
                child: FlutterLogo(),
              ),
              const SizedBox(height: 16),
              buildTextfield('Enter Email'),
              const SizedBox(height: 16),
              buildTextfield('Enter password'),
              const SizedBox(height: 16),
              buildTextfield('Confirm password'),
              const SizedBox(height: 16),
              buildButton(
                context,
                "Sign up",
                () => signUpUser(context),
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
    );
  }

  void signUpUser(BuildContext context) {
    Provider.of<AppState>(context, listen: false).signInState = true;
  }
}
