import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifier extends StateNotifier<void> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigationNotifier() : super(null);

  void goToSignupWIthNumber() {
    navigatorKey.currentState?.pushNamed('/SignupWithNumber');
  }

  void goToOTPScreen() {
    navigatorKey.currentState?.pushNamed('/OtpScreen');
  }

  void goToLogin() {
    navigatorKey.currentState?.pushNamed('/Login');
  }

  void goToForgotPassword() {
    navigatorKey.currentState?.pushNamed('/ForgotPass');
  }

  void goToEmailScreen() {
    navigatorKey.currentState?.pushNamed('/EmailScreen');
  }

  void goToEmailApp() {
    navigatorKey.currentState?.pushNamed('/EmailApp');
  }

  void goToAppNavigator() {
    navigatorKey.currentState?.pushNamed('/');
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, void>(
  (ref) => NavigationNotifier(),
);
