import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const SectionCard({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 154.w,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: kcPrimaryColorLight,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: kcStrokeSecondary, width: 1),
          boxShadow: [
            BoxShadow(
              color: kcStrokePrimary,
              blurRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              title,
              style:
                  TextStyles.titleSecondary.copyWith(color: kcSecondaryColor),
            ),

            verticalSpace04,

            // Description
            Text(
              description,
              style:
                  TextStyles.bodySecondary.copyWith(color: Color(0xFF5D2B2B)),
            ),

            verticalSpace04,

            // Arrow icon aligned to the bottom-right
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.orange.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
