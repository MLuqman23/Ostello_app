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
    super.key,
    this.height,
    this.width,
    this.decoration,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: decoration ?? const BoxDecoration(color: Colors.blue),
      padding: padding,
      margin: margin,
      alignment: alignment,
      child: child,
    );
  }
}
