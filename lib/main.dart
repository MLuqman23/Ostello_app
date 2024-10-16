import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/common/navbar.dart';
import 'package:ostello/provider/navigation_provide.dart';
import 'package:ostello/presentation/amenities.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationNotifier = ref.watch(navigationProvider.notifier);
    return ScreenUtilInit(
      designSize: const Size(400, 890),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationNotifier.navigatorKey,
          initialRoute: '/',
          routes: {
            '/': (context) => const AppNavigator(),
            '/amenities': (context) => const AmenitiesPage(),
          },
        );
      },
    );
  }
}
