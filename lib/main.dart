import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/presentation/login.dart';
import 'package:ostello/presentation/otp.dart';
import 'package:ostello/presentation/sign_up.dart';
import 'package:ostello/presentation/sign_up2.dart';
import 'package:ostello/provider/navigation_provide.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationNotifier = ref.watch(navigationProvider.notifier);
    return ScreenUtilInit(
      designSize: const Size(380, 815),
      builder: (context, child) {
        ResponsiveHelper.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigationNotifier.navigatorKey,
          initialRoute: '/',
          routes: {
            '/': (context) => const SignUp(),
            '/SignupWithNumber': (context) => const SignupWIthNumber(),
            '/OtpScreen': (context) => OTPScreen(),
            '/Login': (context) => const Login(),
          },
        );
      },
    );
  }
}
