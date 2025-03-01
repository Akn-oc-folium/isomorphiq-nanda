import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Widget? icon;
  final Color? disabledColor;
  final bool isSmall;
  final bool isBusy;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isBusy = false,
  })  : icon = null,
        disabledColor = null,
        isSmall = false;

  const PrimaryButton.icon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.disabledColor,
    this.isBusy = false,
  })  : text = null,
        isSmall = false;

  const PrimaryButton.small({
    super.key,
    required this.text,
    required this.onPressed,
    this.isBusy = false,
  })  : icon = null,
        disabledColor = null,
        isSmall = true;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12).r;

    return Container(
      width: icon != null ? 52.w : double.infinity,
      height: isSmall ? 44.h : 52.h,
      decoration: onPressed == null
          ? null
          : BoxDecoration(
              // Match the button’s corners so the shadow lines up
              borderRadius: borderRadius,
              boxShadow: onPressed == null
                  ? null
                  : const [
                      BoxShadow(
                        color: kcSecondaryColor,
                        offset: Offset(0, 4), // Position of the shadow
                        blurRadius: 0, // No blur => hard edge
                      ),
                    ],
            ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: disabledColor ?? kcDisabledColor,
          disabledForegroundColor: kcWhite,
          elevation: 0,
          minimumSize: Size.fromHeight(isSmall ? 48.h : 52.h),
          backgroundColor: kcPrimaryColor,
          foregroundColor: kcWhite,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          padding: icon != null
              ? const EdgeInsets.all(14).r
              : isSmall
                  ? EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.h)
                  : EdgeInsets.symmetric(vertical: 16.h),
        ),
        onPressed: onPressed,
        child: isBusy
            ? Center(
                child: SizedBox(
                  height: 20.r,
                  width: 20.r,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: isBusy
                        ? kcWhite
                        : kcPrimaryColor.withValues(alpha: 0.5),
                    strokeWidth: 2.0.w,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      kcWhite,
                    ),
                  ),
                ),
              )
            : icon ??
                Text(
                  text!,
                  style: isSmall
                      ? TextStyles.buttonText.copyWith(height: 1.125.h)
                      : TextStyles.buttonText,
                ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isSmall;

  const SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
  }) : isSmall = false;

  const SecondaryButton.small({
    super.key,
    required this.text,
    required this.onPressed,
  }) : isSmall = true;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12).r;

    return Container(
      width: double.infinity,
      height: isSmall ? 44.h : 52.h,
      decoration: BoxDecoration(
        // Match the button’s corners so the shadow lines up
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: isSmall ? kcStrokePrimary : kcSecondaryColor,
            offset: Offset(0, isSmall ? 1 : 4), // Position of the shadow
            blurRadius: 0, // No blur => hard edge
          ),
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: kcPrimaryColorAccent,
          disabledForegroundColor: const Color(0xFFE86124),
          minimumSize: Size.fromHeight(isSmall ? 44.h : 52.h),
          backgroundColor: kcPrimaryColorAccent,
          foregroundColor: kcPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          padding: isSmall
              ? EdgeInsets.symmetric(vertical: 12.h, horizontal: 4.w)
              : EdgeInsets.symmetric(vertical: 16.h),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: isSmall
              ? TextStyles.buttonText.copyWith(height: 1.125.h)
              : TextStyles.buttonText,
        ),
      ),
    );
  }
}

// class CustomIconButton extends StatelessWidget {
//   final Widget icon;
//   final VoidCallback onPressed;

//   const CustomIconButton({
//     super.key,
//     required this.icon,
//     required this.onPressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final borderRadius = BorderRadius.circular(12);

//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: borderRadius,
//         boxShadow: const [
//           BoxShadow(
//             color: kcSecondaryColor,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ElevatedButton.icon(
//         onPressed: onPressed,
//         icon: icon,
//         padding: const EdgeInsets.all(14),
//         iconSize: 24,
//         color: kcPrimaryColor,
//       ),
//     );
//   }
// }
