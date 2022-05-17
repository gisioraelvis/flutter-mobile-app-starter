import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_state/app_state_manager.dart';
import 'widgets/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildTextfield("Username"),
              const SizedBox(height: 16),
              buildTextfield("Phone Number"),
              const SizedBox(height: 16),
              buildTextfield("Email"),
              const SizedBox(height: 16),
              buildTextfield('Password'),
              const SizedBox(height: 16),
              buildButton(
                context,
                'Update',
                () => updateProfile(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateProfile(BuildContext context) {
    Provider.of<AppState>(context, listen: false).signInState = false;
  }
}
