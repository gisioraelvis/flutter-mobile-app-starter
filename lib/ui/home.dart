import 'package:app/app_state/app_state.dart';
import 'package:app/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state/app_state.dart';

class Home extends StatefulWidget {
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: AppScreens.home,
      key: ValueKey(AppScreens.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    Container(color: Colors.green),
    Container(color: Colors.blue),
    Container(color: Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateManager>(
      builder: (
        context,
        appStateManager,
        child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter Starter',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              profileButton(),
            ],
          ),
          body: IndexedStack(
            index: widget.currentTab,
            children: pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor:
                Theme.of(context).textSelectionTheme.selectionColor,
            currentIndex: widget.currentTab,
            onTap: (index) {
              Provider.of<AppStateManager>(context, listen: false)
                  .goToTab(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                label: 'Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie_filter),
                label: 'To Buy',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/person_stef.jpeg',
          ),
        ),
        onTap: () {
          // Provider.of<ProfileManager>(context, listen: false)
          //     .tapOnProfile(true);
        },
      ),
    );
  }
}
