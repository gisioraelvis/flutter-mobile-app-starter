import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //late AppState _appState;

  // @override
  // void initState() {
  //   _appState = Provider.of<AppState>(context, listen: false);
  //   onStartUp();
  //   super.initState();
  // }
  //
  // void onStartUp() async {
  //   await _appState.onAppStart();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppState>(context, listen: false).initializeApp();
    print('---SplashScreen didChangeDependencies---');
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
