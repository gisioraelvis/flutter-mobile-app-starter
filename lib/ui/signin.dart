import 'package:app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import 'widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: AppScreens.signin,
      key: ValueKey(AppScreens.signin),
      child: const SignInScreen(),
    );
  }

  final String? username;
  final String? password;

  const SignInScreen({
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
              buildTextfield(username ?? 'Enter username'),
              const SizedBox(height: 16),
              buildTextfield('Enter password'),
              const SizedBox(height: 16),
              buildButton(
                context,
                'Sign In',
                () => Provider.of<AppStateManager>(context, listen: false)
                    .login("username", "password"),
              ),
              const SizedBox(height: 16),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                const Text("Don't have an account yet!"),
                TextButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, AppScreens.signup),
                    print('---Navigate to signup---')
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
}
