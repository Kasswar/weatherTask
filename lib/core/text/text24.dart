import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_task/core/config/app_colors.dart';

class Text24 extends StatelessWidget {
  final String text;
  final Color? color;
  final bool isBold;
  final TextAlign? textAlign;
  const Text24(
      {super.key,
      required this.text,
      this.color,
      this.isBold = false,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 24.sp,
          fontFamily: "NotoKufiArabic",
          color: color ?? AppColors.black,
          fontWeight: isBold ? FontWeight.w500 : FontWeight.w400),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}
