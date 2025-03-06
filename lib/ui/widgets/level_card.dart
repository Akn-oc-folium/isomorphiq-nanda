import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class LevelCard extends StatelessWidget {
  final int level;

  const LevelCard({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12).r,
        color: kcTertiaryColor,
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF1D00B2),
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 36.r,
            width: 36.r,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage(Assets.icons.starLevel.path),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(
              level.toString(),
              style: TextStyles.titleTertiary.copyWith(
                fontSize: 16.sp,
                color: kcTertiaryColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          horizontalSpace08,
          Text(
            'Level',
            style: TextStyles.titleTertiary.copyWith(
              color: kcWhite,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
