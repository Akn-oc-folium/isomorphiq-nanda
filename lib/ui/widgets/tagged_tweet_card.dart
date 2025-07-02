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
    this.onStartDiscussion,
    this.onDelete,
    this.isSelected = false,
  });

  final String user;
  final String content;
  final VoidCallback? onStartDiscussion;
  final VoidCallback? onDelete;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.h,
      width: 940.w,
      padding: EdgeInsets.all(32.r),
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
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
                      color: kcSecondaryColor),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                width: 194.w,
                height: 56.h,
                child: PrimaryButton(
                  text: "Start Discussion",
                  points: 5,
                  onPressed: onStartDiscussion,
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
