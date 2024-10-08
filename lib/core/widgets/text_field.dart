import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.enabledBorderColor,
    this.focusdBorderColor,
    this.enabledBorder,
    this.focusedBorder,
    this.horizontalPadding,
    this.hintTextStyle,
    this.suffixIconColor,
    this.backgroundColor,
    this.obscureText,
    this.verticalPadding,
    this.borderRadius,
    this.inputColor,
  });
  final String hintText;
  final Widget? suffixIcon;
  final Color? enabledBorderColor;
  final Color? focusdBorderColor;
  final double? enabledBorder;
  final double? focusedBorder;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? hintTextStyle;
  final Color? suffixIconColor;
  final Color? backgroundColor;
  final bool? obscureText;
  final double? borderRadius;
  final Color? inputColor;
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: inputColor ?? Colors.white),
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor ?? Colors.grey),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusdBorderColor ?? Colors.white),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.sp),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 17.w,
            vertical: verticalPadding ?? 20.h),
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppTextStyle.font13WhiteLight,
        suffixIcon: suffixIcon ?? const Icon(Icons.visibility),
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
