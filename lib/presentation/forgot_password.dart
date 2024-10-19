import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/gradientbutton.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/provider/navigation_provide.dart';

class ForgotPassword extends ConsumerWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
                Center(
                  child: Image.asset(
                    AssetsImages.forgotpass,
                    height: ResponsiveHelper.height(240),
                    width: ResponsiveHelper.width(295),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.height(36),
                ),
                Text(
                  "Forgot Password",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(24),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xff201926),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.height(8),
                ),
                Center(
                  child: Text(
                    "Enter your registered email ID or Phone number",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(16),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff7C7C7C)),
                  ),
                ),
                SizedBox(
                  height: ResponsiveHelper.height(21),
                ),
                Text(
                  "Email address or Phone number",
                  style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(14),
                      fontWeight: FontWeight.w800,
                      color: const Color(0xff9C9C9C)),
                ),
                SizedBox(
                  height: ResponsiveHelper.height(4),
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffFCFCFC),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xffCFCFCF))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              width: 1, color: Color(0xffCFCFCF))),
                      hintText: 'Enter mail or number...',
                      hintStyle: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(12),
                          color: const Color.fromARGB(255, 182, 179, 179),
                          fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: ResponsiveHelper.height(65),
                ),
                GestureDetector(
                  onTap: () {
                    ref.read(navigationProvider.notifier).goToEmailScreen();
                  },
                  child: Gradientbutton(
                    txt: 'Login',
                    fontsize: ResponsiveHelper.fontSize(16),
                    fontWeight: FontWeight.w900,
                    color: const Color(0xffFFF6FF),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
