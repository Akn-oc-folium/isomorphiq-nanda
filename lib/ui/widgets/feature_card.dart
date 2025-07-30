import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? assetPath;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.title,
    this.subtitle,
    this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120.h,
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: kcStrokeSecondary),
          boxShadow: const [
            BoxShadow(color: kcStrokePrimary, offset: Offset(0, 1)),
          ],
        ),
        child: Row(
          children: [
            if (assetPath != null)
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Image.asset(
                  assetPath!,
                  width: 40.w,
                  fit: BoxFit.contain,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyles.titleSecondary.copyWith(
                      color: kcSecondaryColor,
                      fontSize: 16.sp,
                    ),
                  ),
                  if (subtitle != null) ...[
                    verticalSpace04,
                    Text(
                      subtitle!,
                      style: TextStyles.bodyPrimary.copyWith(
                        color: kcSecondaryColor,
                        fontSize: 14.sp,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
