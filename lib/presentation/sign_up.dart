import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ostello/assets_image/image.dart';
import 'package:ostello/common/gradientbutton.dart';
import 'package:ostello/const/screen_size.dart';
import 'package:ostello/provider/navigation_provide.dart';

class SignUp extends ConsumerWidget {
  const SignUp({super.key});

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
            child: GestureDetector(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: ResponsiveHelper.height(25),
                    horizontal: ResponsiveHelper.width(15)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AssetsImages.signUp,
                        height: ResponsiveHelper.height(250),
                        width: ResponsiveHelper.width(260),
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.height(20),
                    ),
                    Center(
                      child: Text(
                        "What is your Name?",
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
                      "Your Name",
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
                          suffixIcon: Icon(
                            Icons.check_circle,
                            color: const Color(0xff00D566),
                            size: ResponsiveHelper.height(17),
                          )),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.height(85),
                    ),
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(navigationProvider.notifier)
                            .goToSignupWIthNumber();
                      },
                      child: Gradientbutton(
                        txt: 'Next',
                        fontsize: ResponsiveHelper.fontSize(16),
                        fontWeight: FontWeight.w900,
                        color: const Color(0xffFFF6FF),
                      ),
                    ),
                    SizedBox(
                      height: ResponsiveHelper.height(15),
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          ref.read(navigationProvider.notifier).goToLogin();
                        },
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an account?  ',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(14),
                                fontWeight: FontWeight.w800,
                                color: const Color(0xff201926),
                              ),
                              children: [
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(14),
                                    fontWeight: FontWeight.w800,
                                    color:
                                        const Color.fromARGB(255, 155, 61, 237),
                                  ),
                                )
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
