import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifier extends StateNotifier<void> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigationNotifier() : super(null);

  void goToAmenitiesPage() {
    navigatorKey.currentState?.pushNamed('/amenities');
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
