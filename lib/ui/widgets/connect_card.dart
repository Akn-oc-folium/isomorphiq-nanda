import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/fonts.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';

class ConnectCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback? onConnect;
  final bool? isConnected;
  final bool? isComingSoon;
  final bool isBusy;
  final int? points;

  const ConnectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onConnect,
    this.isConnected = false,
    this.isBusy = false,
    this.points,
  }) : isComingSoon = false;

  const ConnectCard.comingSoon({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onConnect,
    this.isConnected = false,
  })  : isComingSoon = true,
        isBusy = false,
        points = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: kcPrimaryColorLight, // Light background color
        borderRadius: BorderRadius.circular(24).r,
        boxShadow: const [
          BoxShadow(
            color: kcStrokePrimary,
            blurRadius: 0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Image
          Image.asset(
            imagePath,
            width: 40.r,
            height: 40.r,
            fit: BoxFit.contain,
          ),
          verticalSpace(6),
          // Title Text
          Text(
            title,
            style: TextStyles.buttonText.copyWith(
              fontSize: 18.sp,
              height: 1.11.h,
              color: kcSecondaryColor,
            ),
          ),
          verticalSpace04,
          Text(
            '+${points ?? 0} Points',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: FontFamily.sora,
              height: 1.25.h,
              letterSpacing: 0,
            ),
          ),
          const Spacer(),
          // Connect Button
          if (isComingSoon!)
            const SecondaryButton.small(
              text: 'Coming Soon',
              onPressed: null,
            )
          else if (isConnected!)
            const SecondaryButton.small(
              text: 'Connected',
              onPressed: null,
            )
          else
            PrimaryButton.small(
              text: 'Connect',
              onPressed: onConnect,
              isBusy: isBusy,
            ),
        ],
      ),
    );
  }
}
