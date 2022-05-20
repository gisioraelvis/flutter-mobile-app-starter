import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import '../navigation/routes.dart';
import 'widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void signInUser(BuildContext context) {
      if (_formKey.currentState!.validate()) {
        String email = _emailController.text;
        String password = _passwordController.text;

        setState(() {
          _isLoading = true;
        });

        // delay of 3s to simulate a long running operation then set loading to false
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            _isLoading = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Successfully signed in...'),
            backgroundColor: Colors.blue,
          ));
          Provider.of<AppState>(context, listen: false).signInState = true;
        });

        // AuthService authUser = AuthService();
        // Future<Map<String, dynamic>?> res = authUser.signIn(email, password);
        // // while waiting for res set loading to true
        // setState(() {
        //   _isLoading = true;
        // });
        //
        // res.then((value) {
        //   setState(() {
        //     _isLoading = false;
        //   });
        //   if (value!['status'] == 'success') {
        //     print("---------Success: $value---------");
        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //       content: Text('Successfully signed in...'),
        //       backgroundColor: Colors.green,
        //     ));
        //     Provider.of<AppState>(context, listen: false).signInState = true;
        //   } else {
        //     print("---------Error: $value---------");
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //       content: Text("${value['data']}"),
        //       backgroundColor: Colors.red,
        //       duration: const Duration(seconds: 5),
        //     ));
        //   }
        // });
        //
        // // Timeout of 10s
        // // if res is null after 10s set loading to false
        // // scaffold a snackbar with Timeout
        //
        // res.timeout(
        //   const Duration(seconds: 5),
        //   onTimeout: () {
        //     setState(() {
        //       _isLoading = false;
        //     });
        //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //       content: Text("Timeout"),
        //       backgroundColor: Colors.red,
        //     ));
        //     return null;
        //   },
        // );
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
                      PasswordInputField(
                        hintText: 'Enter Password',
                        passwordController: _passwordController,
                      ),
                      const SizedBox(height: 16),
                      // buildButton( context,"Sign In", () => signInUser(context),),
                      // while loading show loading indicator over button(instead of text)
                      // while loading disable button
                      // else show sign in button
                      _isLoading
                          ? buildLoadingButton(context)
                          : buildButton(
                              context,
                              "Sign In",
                              () => signInUser(context),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("Don't have an account yet?"),
                    TextButton(
                      onPressed: () => {
                        context.goNamed(AppScreens.signUp),
                      },
                      child: const Text("SignUp",
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

  void signInUser(BuildContext context) {
    Provider.of<AppState>(context, listen: false).signInState = true;
  }
}
