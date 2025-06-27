import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';

class InlineLinkText extends StatelessWidget {
  final String prefixText; // e.g. "By continuing, you agree to our "
  final String linkText; // e.g. "Privacy Policy"
  final TextStyle? prefixStyle; // Optional custom style for prefix
  final TextStyle? linkStyle; // Optional custom style for link
  final VoidCallback onLinkTap; // What happens when user taps link

  const InlineLinkText({
    super.key,
    required this.prefixText,
    required this.linkText,
    required this.onLinkTap,
    this.prefixStyle,
    this.linkStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: prefixText,
        style: prefixStyle ??
            TextStyles.bodySecondary.copyWith(
              color: kcSecondaryColor,
            ),
        children: [
          TextSpan(
            text: linkText,
            style: linkStyle ??
                TextStyles.bodyPrimary.copyWith(
                  color: kcPrimaryColor,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()..onTap = onLinkTap,
          ),
        ],
      ),
    );
  }
}
