import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_state/app_state_manager.dart';
import '../app_state/signin_state.dart';
import '../app_state/onboarding_state.dart';
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
            state.namedLocation(AppScreens.home, params: {'tab': 'shop'}),
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
        path: '/home/:tab(shop|cart|profile)',
        pageBuilder: (context, state) {
          // 2
          final tab = state.params['tab']!;
          return MaterialPage<void>(
            key: state.pageKey,
            // 3
            child: HomeScreen(tab: tab),
          );
        },
        routes: [
          /*GoRoute(
            name: AppScreens.profilePersonal,
            path: 'personal',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const PersonalInfo(),
            ),
          ),
          GoRoute(
            name: AppScreens.profileSignInInfo,
            path: 'signin-info',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const SignInInfo(),
            ),
          ),
          GoRoute(
            name: AppScreens.profileMoreInfo,
            path: 'more-info',
            pageBuilder: (context, state) => MaterialPage<void>(
              key: state.pageKey,
              child: const MoreInfo(),
            ),
          ),*/
        ],
      ),
      // forwarding routes to remove the need to put the 'tab' param in the code
// 1
      GoRoute(
        path: '/shop',
        redirect: (state) =>
            state.namedLocation(AppScreens.home, params: {'tab': 'shop'}),
      ),
      GoRoute(
        path: '/cart',
        redirect: (state) =>
            state.namedLocation(AppScreens.home, params: {'tab': 'cart'}),
      ),
      GoRoute(
        path: '/profile',
        redirect: (state) =>
            state.namedLocation(AppScreens.home, params: {'tab': 'profile'}),
      ),
      GoRoute(
        name: AppScreens.profilePersonal,
        path: '/profile-personal',
        redirect: (state) => state.namedLocation(
          AppScreens.profilePersonal,
          // 4
          params: {'tab': 'profile'},
        ),
      ),
      GoRoute(
        name: AppScreens.profileSignInInfo,
        path: '/profile-signin-info',
        redirect: (state) => state.namedLocation(
          AppScreens.profileSignInInfo,
          params: {'tab': 'profile'},
        ),
      ),
      /*GoRoute(
        name: AppScreens.profileMoreInfo,
        path: '/profile-more-info',
        redirect: (state) => state.namedLocation(
          AppScreens.profileMoreInfo,
          params: {'tab': 'profile'},
        ),
      ),*/
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

      final signedIn = appState.signInState;
      // while the app is initializing display the SplashScreen
      final isInitialized = appState.initialized;
      if (!isInitialized && !splashScreen && !signedIn) {
        print('---redirecting to splash screen---');
        return splashScreenLoc;
      }

      final isOnboardingComplete = appState.onboarding;
      // new install
      if (isInitialized && !isOnboardingComplete && !onboardingScreen) {
        print('---redirecting to onboarding screen---');
        return onboardingScreenLoc;
      }

      // when user is done with onboarding redirect to signup
      if (isInitialized &&
          isOnboardingComplete &&
          onboardingScreen &&
          !signedIn) {
        print('---redirecting to signUp screen---');
        return signUpScreenLoc;
      }

      if (isInitialized && isOnboardingComplete && !signedIn) {
        print('---redirecting to signUp screen---');
        return signInScreenLoc;
      }

      // if (isInitialized &&
      //     isOnboardingComplete &&
      //     !onboardingScreen &&
      //     !signedIn &&
      //     !signingUpScreen) {
      //   print('---redirecting to signUp screen---');
      //   return signInScreenLoc;
      // }

      // If signed in redirect to home screen
      if (isOnboardingComplete &&
          signedIn &&
          (signInScreen || signingUpScreen)) {
        print('---redirecting to root screen---');
        return rootLoc;
      }
      return null;
    },
  );
}
