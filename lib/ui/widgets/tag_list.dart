import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';

class TagList extends StatelessWidget {
  final List<String> tags;

  const TagList({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
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
      child: Wrap(
        spacing: 8.0,
        runSpacing: 4.0,
        children: tags
            .map((tag) => Chip(
                  backgroundColor: kcWhite,
                  label: Text(
                    tag,
                    style: TextStyles.bodySecondary
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
