import 'package:app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import 'widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppScreens.signup,
      key: ValueKey(AppScreens.signup),
      child: const SignUpScreen(),
    );
  }

  final String? username;
  final String? password;

  const SignUpScreen({
    Key? key,
    this.username,
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
                () => {
                  Provider.of<AppStateManager>(context, listen: false)
                      .login('mockUsername', 'mockPassword')
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppScreens.signin),
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
}
