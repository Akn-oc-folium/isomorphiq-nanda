import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class UserStatusCard extends StatelessWidget {
  final String name;
  final int rank;

  const UserStatusCard({Key? key, required this.name, required this.rank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).r,
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
                height: 42.r,
                width: 42.r,
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
