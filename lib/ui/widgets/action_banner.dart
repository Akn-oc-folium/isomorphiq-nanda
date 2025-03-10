import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';

class ActionBanner extends StatelessWidget {
  final Widget leading;
  final Text text;
  final String buttonLabel;
  final VoidCallback onButtonPressed;

  const ActionBanner({
    super.key,
    required this.leading,
    required this.text,
    required this.buttonLabel,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0).r,
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: kcStrokeSecondary),
        boxShadow: [
          BoxShadow(
            color: kcStrokePrimary,
            blurRadius: 0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          //Leading widget (icon, text, number) if provided
          leading,
          horizontalSpace08,
          // Expanded text in the middle
          Expanded(
            child: text,
          ),
          horizontalSpace08,
          // Right-aligned button
          PrimaryButton.small(
            width: 96.w,
            text: buttonLabel,
            onPressed: onButtonPressed,
          ),
        ],
      ),
    );
  }
}
