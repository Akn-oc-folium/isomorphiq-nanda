import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

class UserStatusCard extends StatelessWidget {
  final String name;
  final int rank;

  const UserStatusCard({super.key, required this.name, required this.rank});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8).r,
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: const [
          BoxShadow(
            color: kcStrokePrimary,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar or user icon
          Image.asset(Assets.icons.avatar.path, width: 30.w, height: 32.h),
          horizontalSpace08,
          // Name and rank
          Expanded(
            child: Text(
              name,
              style: TextStyles.buttonText.copyWith(
                color: kcSecondaryColor,
                height: 1.125.h,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'Rank',
                style: TextStyles.buttonText.copyWith(
                  color: kcSecondaryColor,
                  height: 1.125.h,
                ),
              ),
              horizontalSpace08,
              Container(
                alignment: Alignment.center,
                height: 40.r,
                width: 40.r,
                decoration: BoxDecoration(
                  color: kcPrimaryColorAccent,
                  borderRadius: BorderRadius.circular(8).r,
                ),
                child: Text(
                  rank == 0 ? '--' : rank.toString(),
                  style: TextStyles.buttonText.copyWith(
                    color: kcSecondaryColor,
                    height: 1.125.h,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
