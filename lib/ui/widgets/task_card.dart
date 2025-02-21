import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';

class TaskCard extends StatelessWidget {
  final VoidCallback? onTap;
  final String description;
  final bool? isDone;

  const TaskCard({
    super.key,
    this.onTap,
    required this.description,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: kcWhite,
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
          Expanded(
            child: Text(
              description,
              style:
                  TextStyles.titleSecondary.copyWith(color: kcSecondaryColor),
            ),
          ),
          horizontalSpace16,
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
