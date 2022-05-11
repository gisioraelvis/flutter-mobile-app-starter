import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import '../navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
        key: ValueKey(AppScreens.splash),
        name: AppScreens.splash,
        child: const SplashScreen());
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/built-with-flutter.png'),
            const SizedBox(
              height: 50,
            ),
            const SizedBox(
              width: 200,
              child: LinearProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }
}
