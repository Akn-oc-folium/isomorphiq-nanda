import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

Widget _pointsCard(String points) {
  return Container(
    width: 118.w,
    height: 54.h,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    decoration: BoxDecoration(
      color: kcPrimaryColorLight,
      borderRadius: BorderRadius.circular(12.r),
      border: Border.all(
        color: kcStrokeSecondary,
      ),
      boxShadow: const [
        BoxShadow(
          color: kcStrokePrimary,
          offset: Offset(0, 1),
        ),
      ],
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          points,
          style: TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
        ),
        horizontalSpace04,
        Image.asset(Assets.icons.iqCoin.path, width: 24.w),
      ],
    ),
  );
}
