import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import '../navigation/routes.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    AppState appState;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Account'),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 150,
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  child: Text('E', style: TextStyle(fontSize: 50)),
                ),
              ),
            ),
            Expanded(
                child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(10),
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('Profile'),
                    onTap: () =>
                        GoRouter.of(context).pushNamed(AppScreens.profile),
                  ),
                  const Divider(
                    color: Colors.green,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () => context.pushNamed(AppScreens.settings),
                  ),
                  const Divider(
                    color: Colors.green,
                    indent: 16,
                    endIndent: 16,
                  ),
                  ListTile(
                    leading: const Icon(Icons.power_settings_new),
                    title: const Text('Sign out'),
                    onTap: () => signOutUser(context),
                  ),
                ],
              ),
            )),
          ],
        ));
  }

  void signOutUser(BuildContext context) {
    Provider.of<AppState>(context, listen: false).signInState = false;
  }
}
