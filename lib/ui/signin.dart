import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import '../app_state/signin_state.dart';
import '../navigation/routes.dart';
import 'widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  final String? email;
  final String? password;

  const SignInScreen({
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
              buildTextfield(email ?? 'Enter email'),
              const SizedBox(height: 16),
              buildTextfield('Enter password'),
              const SizedBox(height: 16),
              buildButton(
                context,
                'Sign In',
                () => signInUser(context),
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text("Don't have an account yet!"),
                TextButton(
                  onPressed: () => {
                    context.goNamed(AppScreens.signUp),
                    print('---redirecting to signup from signin---')
                  },
                  child: const Text("SignUp",
                      style: TextStyle(color: Colors.blue)),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }

  void signInUser(BuildContext context) {
    Provider.of<AppState>(context, listen: false).signInState = true;
  }
}
