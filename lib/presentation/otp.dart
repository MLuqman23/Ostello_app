import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/provider/navigation_provide.dart';
import 'package:ostello/provider/provider.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends ConsumerWidget {
  OTPScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinController = ref.watch(pinControllerProvider);
    final pinNotifier = ref.read(pinControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(
              left: ResponsiveHelper.width(15),
              top: ResponsiveHelper.height(10)),
          child: GestureDetector(
            onTap: () {
              ref.read(navigationProvider.notifier).goBack();
            },
            child: CircleAvatar(
              backgroundColor: const Color(0xff7D23E0),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: ResponsiveHelper.height(17),
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.width(15),
              vertical: ResponsiveHelper.height(25)),
          child: Column(children: [
            Center(
              child: Image.asset(
                AssetsImages.handWithPhone,
                height: ResponsiveHelper.height(290),
                width: ResponsiveHelper.width(260),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: ResponsiveHelper.height(40),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'OTP ',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(24),
                      fontWeight: FontWeight.w800,
                      color: const Color.fromARGB(255, 155, 61, 237),
                    ),
                    children: [
                      TextSpan(
                        text: 'Verification',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(24),
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff201926),
                        ),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: ResponsiveHelper.height(8),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter the OTP sent to +9198684113214 ",
                  style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(14),
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff7C7C7C)),
                ),
                Icon(Icons.edit_square,
                    size: ResponsiveHelper.height(16),
                    color: const Color(0xff7C7C7C))
              ],
            ),
            SizedBox(
              height: ResponsiveHelper.height(19),
            ),
            Pinput(
              controller: pinController,
              defaultPinTheme: defaultPinTheme,
              showCursor: true,
              length: 4,
              onChanged: (value) {
                pinNotifier.updatePin(value);
              },
            ),
            SizedBox(
              height: ResponsiveHelper.height(16),
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: 'Didn’t receive the code? ',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(14),
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff201926),
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend in 18s',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(14),
                          fontWeight: FontWeight.w800,
                          color: const Color.fromARGB(255, 155, 61, 237),
                        ),
                      )
                    ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  final defaultPinTheme = PinTheme(
    width: 42,
    height: 42,
    textStyle: TextStyle(
        fontSize: ResponsiveHelper.fontSize(20),
        color: const Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w800),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(ResponsiveHelper.fontSize(10)),
    ),
  );
}
