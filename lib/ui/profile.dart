import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../navigation/routes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Colors.black, width: 1.0, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: getProfileCard(context, index),
        );
      },
    );
  }

  Widget getProfileCard(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text(
                'Personal Info',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                // Adds Personal Page Route
                context.goNamed(AppScreens.personalInfo);
              },
            ),
          ),
        );
      case 1:
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              title: const Text(
                'Sign In Info',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                //Adds Signing Info Route
                context.goNamed(AppScreens.profileSignInInfo);
              },
            ),
          ),
        );
    }
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: const Text(
            'More Info',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onTap: () {
            //Adds More Info Route
            context.goNamed(AppScreens.profileMoreInfo);
          },
        ),
      ),
    );
  }
}
