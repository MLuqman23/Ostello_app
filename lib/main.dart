import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/common/navbar.dart';
import 'package:ostello/data/navigation_provide.dart';
import 'package:ostello/presentation/amenities.dart';

void main() {
  runApp(const ProviderScope(child: myApp()));
}

class myApp extends ConsumerWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationNotifier = ref.watch(navigationProvider.notifier);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationNotifier.navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => const AppNavigator(),
        '/amenities': (context) => AmenitiesPage(),
      },
    );
  }
}
