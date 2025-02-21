import 'package:flutter/material.dart';
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

  const ConnectCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onConnect,
    this.isConnected = false,
  }) : isComingSoon = false;

  const ConnectCard.comingSoon({
    super.key,
    required this.imagePath,
    required this.title,
    required this.onConnect,
    this.isConnected = false,
  }) : isComingSoon = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kcPrimaryColorLight, // Light background color
        borderRadius: BorderRadius.circular(22),
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
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
          verticalSpace(12),
          // Title Text
          Text(
            title,
            style: TextStyles.buttonText.copyWith(
              fontSize: 18,
              height: 1.11,
              color: kcSecondaryColor,
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
            ),
        ],
      ),
    );
  }
}
