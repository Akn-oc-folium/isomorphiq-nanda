import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';

class TaskCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final String? description;
  final String? imagePath;
  final bool? isDone;

  const TaskCard({
    super.key,
    this.onTap,
    required this.title,
    this.isDone = false,
  })  : description = null,
        imagePath = null;

  const TaskCard.description({
    super.key,
    this.onTap,
    required this.title,
    required this.description,
    required this.imagePath,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: description != null ? kcPrimaryColorLight : kcWhite,
        borderRadius: BorderRadius.circular(12).r,
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
        children: [
          if (description != null) ...[
            Container(
              width: 64.w,
              height: 64.w,
              decoration: BoxDecoration(
                color: kcWhite,
                borderRadius: BorderRadius.circular(12).r,
              ),
              child: Center(
                child: SvgPicture.asset(
                  imagePath!,
                  width: 36.w,
                  height: 36.w,
                  fit: BoxFit.contain,
                  colorFilter:
                      const ColorFilter.mode(kcPrimaryColor, BlendMode.srcIn),
                ),
              ),
            ),
            horizontalSpace08,
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyles.titleSecondary
                      .copyWith(color: kcSecondaryColor),
                ),
                if (description != null) ...[
                  verticalSpace04,
                  Text(
                    description!,
                    style: TextStyles.bodySecondary
                        .copyWith(color: Color(0xFF636363)),
                  ),
                ],
              ],
            ),
          ),
          horizontalSpace08,
          PrimaryButton.icon(
            disabledColor: isDone! ? kcStrokeSecondary : kcPrimaryColor,
            icon: SvgPicture.asset(
              isDone! ? Assets.icons.checkMark : Assets.icons.arrowRight,
              height: 24.r,
              width: 24.r,
            ),
            onPressed: onTap,
          ),
        ],
      ),
    );
  }
}
