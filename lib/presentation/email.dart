import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/gradientbutton.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/provider/navigation_provide.dart';

class EmailScreen extends ConsumerWidget {
  const EmailScreen({super.key});

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
              horizontal: ResponsiveHelper.width(20),
              vertical: ResponsiveHelper.height(25)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ResponsiveHelper.height(35),
              ),
              Center(
                child: Image.asset(
                  AssetsImages.email,
                  height: ResponsiveHelper.height(250),
                  width: ResponsiveHelper.width(250),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(50),
              ),
              Center(
                child: Text(
                  "Check your email",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(24),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff201926),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(8),
              ),
              Center(
                child: Text(
                  "Password recovery instructions have been sent to your email",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(16),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff7C7C7C)),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(32),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(navigationProvider.notifier).goToEmailApp();
                },
                child: Gradientbutton(
                  txt: 'Open Email',
                  fontsize: ResponsiveHelper.fontSize(16),
                  fontWeight: FontWeight.w800,
                  color: const Color(0xffFFF6FF),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(16),
              ),
              Center(
                child: Text(
                  "Will do it later",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(16),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff7D23E0),
                  ),
                ),
              ),
              SizedBox(
                height: ResponsiveHelper.height(32),
              ),
              Center(
                child: Text(
                  "No email? Check spam or retry with a valid email",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(14),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff4C4452),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
