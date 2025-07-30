import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

class TwitterToolsMobileCard extends StatelessWidget {
  final int number;
  final String title;
  final VoidCallback? onPressed;

  const TwitterToolsMobileCard({
    super.key,
    required this.number,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: kcPrimaryColorLight,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
              color: kcWhite,
              borderRadius: BorderRadius.circular(12.r),
            ),
            alignment: Alignment.center,
            child: Text(
              number.toString(),
              style: TextStyles.titlePrimary.copyWith(
                color: kcPrimaryColor,
                fontSize: 20.sp,
              ),
            ),
          ),
          horizontalSpace16,
          Expanded(
            child: Text(
              title,
              style: TextStyles.titleSecondary.copyWith(
                color: kcSecondaryColor,
                fontSize: 16.sp,
                height: 1.2,
              ),
            ),
          ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(Icons.arrow_forward, color: kcWhite, size: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
