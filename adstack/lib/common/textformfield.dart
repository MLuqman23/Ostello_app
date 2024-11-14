// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReusableTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final InputBorder? border;
  final TextEditingController controller;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final bool obscureText;
  final TextInputType keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Color? hintTextColor;
  final Color? labelTextColor;
  final VoidCallback? ontap;
  final int? maxLength;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;

  const ReusableTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.hintTextColor = Colors.black,
    this.border,
    this.floatingLabelBehavior,
    this.labelTextColor,
    this.ontap,
    this.maxLength,
    this.suffix,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: const Color(0xffF5F5F5),
      ),
      onTap: ontap,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      maxLength: maxLength,
      decoration: InputDecoration(
          floatingLabelBehavior: floatingLabelBehavior,
          labelText: labelText,
          hintText: hintText,
          suffixIcon: suffix,
          filled: true,
          fillColor: const Color(0xff1B1C1B),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelStyle: GoogleFonts.roboto(
            fontSize: 14,
            color: labelTextColor,
            fontWeight: FontWeight.w500,
          ),
          hintStyle: GoogleFonts.roboto(
            fontSize: 14,
            color: hintTextColor,
            fontWeight: FontWeight.w400,
          ),
          border: border,
          contentPadding: contentPadding
          // Use padding property instead of contentPadding
          ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
