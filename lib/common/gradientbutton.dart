import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Gradientbutton extends StatelessWidget {
  final String txt;
  final TextAlign textAlign;
  final double fontsize;
  final FontWeight? fontWeight;
  final Color? color;
  final IconData? iconData;

  const Gradientbutton(
      {super.key,
      required this.txt,
      required this.fontsize,
      this.fontWeight = FontWeight.w500,
      this.color,
      this.textAlign = TextAlign.start,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const LinearGradient(colors: [
            Color(0xff7837CB),
            Color(0xff388DB1),
          ])),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            txt,
            textAlign: textAlign,
            style: GoogleFonts.roboto(
              fontSize: fontsize,
              fontWeight: fontWeight,
              color: color,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 8.h,
          ),
          Icon(
            iconData,
            color: color,
            size: 15,
          )
        ],
      ),
    );
  }
}
