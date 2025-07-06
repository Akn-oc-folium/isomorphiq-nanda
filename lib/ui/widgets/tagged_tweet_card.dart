import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';

class TaggedTweetCard extends StatelessWidget {
  const TaggedTweetCard({
    super.key,
    required this.user,
    required this.content,
    this.buttonText = "Start Discussion",
    this.points = 5,
    this.isSelected = false,
    this.onPrimaryAction,
    this.onDelete,
  });

  final String user;
  final String content;
  final String buttonText;
  final int points;
  final bool isSelected;
  final VoidCallback? onPrimaryAction;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 940.w,
      padding: EdgeInsets.all(32.r),
      decoration: BoxDecoration(
        color: isSelected
            ? kcPrimaryColorLight.withOpacity(0.6)
            : kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  user,
                  style: TextStyles.titleSecondary.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: kcSecondaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 194.w,
                height: 56.h,
                child: PrimaryButton(
                  text: buttonText,
                  points: points,
                  onPressed: onPrimaryAction,
                ),
              ),
              horizontalSpace08,
              horizontalSpace04,
              PrimaryButton.icon(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ],
          ),
          verticalSpace16,
          verticalSpace16,
          Expanded(
            child: Text(
              content,
              style: TextStyles.bodyPrimary.copyWith(
                color: kcSecondaryColor,
                fontSize: 18.sp,
                height: 1.4,
              ),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
