import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';

class TaggedTweetMobileCard extends StatelessWidget {
  final String handle;
  final String tweet;
  final VoidCallback? onTap;

  const TaggedTweetMobileCard({
    super.key,
    required this.handle,
    required this.tweet,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: kcPrimaryColorLight,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              handle,
              style: TextStyles.titleSecondary.copyWith(
                color: kcSecondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              tweet,
              style: TextStyles.bodyPrimary.copyWith(
                color: kcSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
