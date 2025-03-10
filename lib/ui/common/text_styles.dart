import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/fonts.gen.dart';

class TextStyles {
  TextStyles._();

  static TextStyle get titlePrimary {
    return TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.sora,
      height: 1.h,
      letterSpacing: -1.w,
    );
  }

  static TextStyle get titleSecondary {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.sora,
      height: 1.125.h,
    );
  }

  static TextStyle get titleTertiary {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.sora,
      height: 1.428.h,
    );
  }

  static TextStyle get bodyPrimary {
    return TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.figtree,
      height: 1.428.h,
    );
  }

  static TextStyle get bodySecondary {
    return TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      fontFamily: FontFamily.figtree,
      height: 1.333.h,
    );
  }

  static TextStyle get buttonText {
    return TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.sora,
      height: 1.h,
    );
  }

  static TextStyle get caption {
    return TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.sora,
    );
  }
}
