import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/fonts.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';

class AppThemes {
  AppThemes._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kcWhite,
      appBarTheme: AppBarTheme(
        toolbarHeight: 52.h,
        elevation: 0,
        iconTheme: IconThemeData(color: kcSecondaryColor),
        actionsIconTheme: IconThemeData(color: kcSecondaryColor),
        centerTitle: true,
        foregroundColor: kcSecondaryColor,
        backgroundColor: kcWhite,
        titleTextStyle: TextStyle(
          color: kcSecondaryColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          fontFamily: FontFamily.sora,
          height: 1.h,
          letterSpacing: 0,
        ),
        toolbarTextStyle: TextStyles.titleSecondary.copyWith(letterSpacing: 0),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 64.h,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: kcSecondaryColor,
        elevation: 0,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return IconThemeData(color: kcWhite, size: 24.0.r);
            }
            return IconThemeData(
                color: kcWhite.withValues(alpha: 0.64), size: 24.0.r);
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.sora,
                height: 1.66.h,
                color: kcWhite,
              );
            }
            return TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.sora,
              height: 1.66.h,
              color: kcWhite.withValues(alpha: 0.5),
            );
          },
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: kcWhite,
        unselectedLabelColor: kcPrimaryColor,
        labelStyle: TextStyles.titleSecondary,
        unselectedLabelStyle: TextStyles.titleSecondary,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: kcPrimaryColor,
          boxShadow: const [
            BoxShadow(
              color: kcSecondaryColor,
              offset: Offset(0, 4),
              blurRadius: 0,
            ),
          ],
        ),
        dividerHeight: 0,
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbVisibility: WidgetStatePropertyAll(false),
        trackVisibility: WidgetStatePropertyAll(false),
      ),
    );
  }
}
