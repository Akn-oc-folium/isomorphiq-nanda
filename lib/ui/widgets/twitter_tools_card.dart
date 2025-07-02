import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

class TwitterToolsCard extends StatelessWidget {
  final int number;
  final String title;
  final VoidCallback? onPressed;

  const TwitterToolsCard({
    super.key,
    required this.number,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 221.h,
      constraints: BoxConstraints(maxWidth: 288.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: kcPrimaryColorLight,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48.h,
                  width: 48.w,
                  decoration: BoxDecoration(
                    color: kcWhite,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Center(
                    child: Text(
                      number.toString(),
                      style: TextStyles.titlePrimary
                          .copyWith(color: kcPrimaryColor),
                    ),
                  ),
                ),
                verticalSpace16,
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.titleSecondary.copyWith(
                      color: const Color(0xFF652C46),
                      fontSize: 18.sp,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 16.w,
            child: Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: kcPrimaryColor,
              ),
              child: IconButton(
                onPressed: onPressed ?? () {},
                icon: Icon(
                  Icons.arrow_forward,
                  color: kcWhite,
                  size: 24.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
