import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'app_state/app_state_manager.dart';
import 'navigation/router.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // await preferences.clear();

  final prefs = await SharedPreferences.getInstance();
  final appState = AppState(prefs);
  appState.onAppStart();
  runApp(App(appState: appState));
}

class App extends StatelessWidget {
  final AppState appState;
  const App({Key? key, required this.appState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>(
          lazy: false,
          create: (BuildContext createContext) => appState,
        ),
        Provider<AppRouter>(
          lazy: false,
          create: (BuildContext createContext) => AppRouter(appState),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          final router = Provider.of<AppRouter>(context, listen: false).router;
          return MaterialApp.router(
            routeInformationParser: router.routeInformationParser,
            routerDelegate: router.routerDelegate,
            debugShowCheckedModeBanner: false,
            title: 'Navigation App',
            theme: AppTheme.light(),
          );
        },
      ),
    );
  }
}
