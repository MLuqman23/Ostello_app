import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static void init(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(380, 850), minTextAdapt: true);
  }

  static double width(double value) => value.w;

  static double height(double value) => value.h;

  static double fontSize(double value) => value.sp;

  static EdgeInsets padding(double all) => EdgeInsets.all(all.r);
}
