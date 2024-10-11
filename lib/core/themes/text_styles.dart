import 'package:fit_track_app/core/themes/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class TextStyles {
  static String montserrat = 'Montserrat';
  static String bebasNeue = 'BebasNeue';

  static TextStyle styleRegular(
    context, {
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? ColorsManager.textBaseColor,
      fontSize: fontSize ?? 16.sp,
      fontFamily: fontFamily ?? 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium(
    context, {
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? ColorsManager.textBaseColor,
      fontSize: fontSize ?? 16.sp,
      fontFamily: fontFamily ?? 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold(
    context, {
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? ColorsManager.textBaseColor,
      fontSize: fontSize ?? 16.sp,
      fontFamily: fontFamily ?? 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleBold(
    context, {
    Color? color,
    double? fontSize,
    String? fontFamily,
  }) {
    return TextStyle(
      color: color ?? ColorsManager.textBaseColor,
      fontSize: fontSize ?? 16.sp,
      fontFamily: fontFamily ?? 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }
}
