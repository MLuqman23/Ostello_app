import 'package:flutter/material.dart';

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
      // width: ResponsiveHelper.width(double.infinity),
      // height: ResponsiveHelper.height(49),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: const LinearGradient(colors: [
            Color(0xff7D23E0),
            Color(0xff490087),
          ])),
      child: Center(
        child: Text(
          txt,
          textAlign: textAlign,
          style: TextStyle(
            fontSize: fontsize,
            fontWeight: fontWeight,
            color: color,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
