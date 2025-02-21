import 'package:flutter/material.dart';
import 'package:isomorph_iq/gen/fonts.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';

class AppThemes {
  AppThemes._();

  static ThemeData getTheme() {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: kcWhite,
      navigationBarTheme: NavigationBarThemeData(
        height: 64,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: kcSecondaryColor,
        elevation: 0,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: kcWhite, size: 24.0);
            }
            return IconThemeData(
                color: kcWhite.withValues(alpha: 0.64), size: 24.0);
          },
        ),
        labelTextStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.selected)) {
              return const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.sora,
                height: 1.66,
                color: kcWhite,
              );
            }
            return TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: FontFamily.sora,
              height: 1.66,
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
          borderRadius: BorderRadius.circular(12),
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
        thumbVisibility: WidgetStateProperty.all(false),
      ),
    );
  }
}
