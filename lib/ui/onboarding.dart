import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../app_state/app_state_manager.dart';
import '../navigation/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  final Color rwColor = const Color.fromRGBO(64, 143, 77, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: onBoardingScreens()),
            scrollIndicators(),
            actionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget actionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MaterialButton(
          child: Row(
            children: const <Widget>[
              Icon(Icons.check),
              Text('Done'),
            ],
          ),
          onPressed: () {
            Provider.of<AppState>(context, listen: false).onboarding = true;
            context.goNamed(AppScreens.signUp);
          },
        ),
      ],
    );
  }

  Widget onBoardingScreens() {
    return PageView(
      controller: controller,
      children: [
        onboardPageView(
          'Welcome onboard!!!!',
          const AssetImage("assets/recommend.png"),
        ),
        onboardPageView(
          'Onboarding screen',
          const AssetImage('assets/list.png'),
        ),
        onboardPageView(
          'Another onboarding screen',
          const AssetImage('assets/sheet.png'),
        ),
      ],
    );
  }

  Widget onboardPageView(String text, ImageProvider imageProvider) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: Image(
              fit: BoxFit.fitWidth,
              image: imageProvider,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget scrollIndicators() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: WormEffect(activeDotColor: rwColor),
    );
  }
}
