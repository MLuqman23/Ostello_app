import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;

  const CustomContainer({
    Key? key,
    this.height,
    this.width,
    this.decoration,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration ?? BoxDecoration(color: Colors.blue),
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: child,
    );
  }
}
