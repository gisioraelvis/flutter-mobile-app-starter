import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_state/app_state_manager.dart';
import 'routes.dart';
import '../ui/screens.dart';

class AppRouter {
  final AppState appState;

  AppRouter(this.appState);

  late final router = GoRouter(
    refreshListenable: appState,

    debugLogDiagnostics: true,

    urlPathStrategy: UrlPathStrategy.path,

    routes: [
      GoRoute(
        name: AppScreens.rootRoute,
        path: '/',
        redirect: (state) =>
            // Change to Home Route
            state.namedLocation(AppScreens.home, params: {'tab': 'home'}),
      ),
      GoRoute(
        name: AppScreens.splash,
        path: '/splash',
        pageBuilder: (context, state) => MaterialPage<void>(
          name: AppScreens.splash,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        name: AppScreens.onBoarding,
        path: '/onboarding',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const OnboardingScreen(),
        ),
      ),
      GoRoute(
        name: AppScreens.signIn,
        path: '/signin',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SignInScreen(),
        ),
      ),
      GoRoute(
        name: AppScreens.signUp,
        path: '/signup',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const SignUpScreen(),
        ),
      ),
      // Home route and children
      GoRoute(
        name: AppScreens.home,
        // 1
        path: '/home/:tab(home|screen1|screen2)',
        pageBuilder: (context, state) {
          // 2
          final tab = state.params['tab']!;
          return MaterialPage<void>(
            key: state.pageKey,
            // 3
            child: HomeScreen(tab: tab),
          );
        },
      ),
      GoRoute(
        name: AppScreens.account,
        path: '/account',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const AccountScreen(),
        ),
        routes: [
          GoRoute(
            name: AppScreens.profile,
            path: 'profile',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const ProfileScreen(),
            ),
          ),
          GoRoute(
            name: AppScreens.settings,
            path: 'settings',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SettingsScreen(),
            ),
          ),
        ],
      ),
      // forwarding routes to remove the need to put the 'tab' param in the code
      GoRoute(
        path: '/home',
        redirect: (state) =>
            state.namedLocation(AppScreens.home, params: {'tab': 'home'}),
      ),
      GoRoute(
        path: '/screen1',
        redirect: (state) =>
            state.namedLocation(AppScreens.home, params: {'tab': 'screen1'}),
      ),
      GoRoute(
        path: '/screen2',
        redirect: (state) =>
            state.namedLocation(AppScreens.home, params: {'tab': 'screen2'}),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorScreen(error: state.error),
    ),

    // redirect to the login page if the user is not logged in
    redirect: (state) {
      //SplashScreen
      final splashScreenLoc = state.namedLocation(AppScreens.splash);
      final splashScreen = state.subloc == splashScreenLoc;

      // OnBoardingScreen
      final onboardingScreenLoc = state.namedLocation(AppScreens.onBoarding);
      final onboardingScreen = state.subloc == onboardingScreenLoc;

      // SignInScreen
      final signInScreenLoc = state.namedLocation(AppScreens.signIn);
      final signInScreen = state.subloc == signInScreenLoc;

      // SignUpScreen
      final signUpScreenLoc = state.namedLocation(AppScreens.signUp);
      final signingUpScreen = state.subloc == signUpScreenLoc;

      // Root route (HomeScreen)
      final rootLoc = state.namedLocation(AppScreens.rootRoute);

      /*
      * Must always check that weren't already on the screen redirecting to.
      * i.e
      * if redirecting to the splash screen, we must not be on the splash screen
      * if redirecting to the sign in screen, we must not be on the sign in screen
      * etc.
      * This to avoid loop redirects.
      */

      // while the app is initializing display the SplashScreen
      final isInitialized = appState.initialized;
      if (!isInitialized && !splashScreen) {
        print('---redirecting to splash screen---');
        return splashScreenLoc;
      }

      // new install
      // Redirect to onboarding
      final isOnboardingComplete = appState.onboarding;
      if (isInitialized && !isOnboardingComplete && !onboardingScreen) {
        print('---redirecting to onboarding screen---');
        return onboardingScreenLoc;
      }

      // new install/user
      // when new user is done with onboarding redirect to signup
      if (isInitialized &&
          isOnboardingComplete &&
          onboardingScreen &&
          !signingUpScreen) {
        print('---redirecting to signUp screen---');
        return signUpScreenLoc;
      }

      // existing user
      // user isn't signedIn redirect to signIn
      final signedIn = appState.signInState;
      if (isInitialized &&
          isOnboardingComplete &&
          !signedIn &&
          !(signingUpScreen || signInScreen)) {
        print('---redirecting to signUp screen---');
        return signInScreenLoc;
      }

      // If signed in redirect to home screen
      if (isInitialized &&
          signedIn &&
          (splashScreen || signInScreen || signingUpScreen)) {
        print('---redirecting to root screen---');
        return rootLoc;
      }
      return null;
    },
  );
}
