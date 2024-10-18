import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/gradientbutton.dart';
import 'package:ostello/common/int_number.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/provider/navigation_provide.dart';

class SignupWIthNumber extends ConsumerWidget {
  const SignupWIthNumber({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              ref.read(navigationProvider.notifier).goBack();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: Row(
          children: [
            SizedBox(
              width: ResponsiveHelper.width(55),
            ),
            Image.asset(
              AssetsImages.appbar,
              height: ResponsiveHelper.height(28),
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: ResponsiveHelper.width(10),
            ),
            Text('OSTELLO',
                style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(24),
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff7D23E0),
                    overflow: TextOverflow.ellipsis))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.width(15),
              vertical: ResponsiveHelper.height(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AssetsImages.mobile,
                  height: ResponsiveHelper.height(235),
                  width: ResponsiveHelper.width(215),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(30),
              ),
              Center(
                child: Text(
                  "Enter your Mobile Number",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(22),
                    fontWeight: FontWeight.w900,
                    color: const Color(0xff39383A),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(8),
              ),
              Center(
                child: Text(
                  "Best Teacher | Affordable Pricing | Live Batches | DPP | Notes",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(12),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff9C9C9C)),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(20),
              ),
              Text(
                "Mobile Number",
                style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(14),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff9C9C9C)),
              ),
              SizedBox(
                height: ResponsiveHelper.height(4),
              ),
              PhoneNumberInputWidget(),
              SizedBox(
                height: ResponsiveHelper.height(90),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(navigationProvider.notifier).goToOTPScreen();
                },
                child: Gradientbutton(
                  txt: 'Send OTP',
                  fontsize: ResponsiveHelper.fontSize(16),
                  fontWeight: FontWeight.w900,
                  color: const Color(0xffFFF6FF),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(20),
              ),
              Center(
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: 'By creating an account, you agree to our ',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(10),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff201926),
                      ),
                      children: [
                        TextSpan(
                          text: 'Term and Conditions',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(10),
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 155, 61, 237),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
