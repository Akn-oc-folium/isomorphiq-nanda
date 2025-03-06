import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class StreakRedeemCard extends StatefulWidget {
  final ValueChanged<bool>? onRedeem;

  const StreakRedeemCard({super.key, required this.onRedeem});

  @override
  State<StreakRedeemCard> createState() => _StreakRedeemCardState();
}

class _StreakRedeemCardState extends State<StreakRedeemCard> {
  bool _isPressed = false;

  Future<void> _handlePress() async {
    if (widget.onRedeem != null) {
      widget.onRedeem!(_isPressed);
    }

    setState(() {
      _isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handlePress,
      child: Container(
        width: 186.w,
        height: 45.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12).r,
          color: kcPrimaryColorAccent,
          boxShadow: const [
            BoxShadow(
              color: kcSecondaryColor,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            // Left part background
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: ClipPath(
                clipper: SlashedBackgroundClipper(),
                child: Container(
                  width: 110.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12).r,
                      bottomLeft: const Radius.circular(12).r,
                    ),
                    color: kcPrimaryColor,
                  ),
                ),
              ),
            ),
            // Content of the component
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Day 1 part
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, top: 12, bottom: 12).r,
                  child: Row(
                    children: [
                      ImageIcon(
                        AssetImage(Assets.icons.fireFill.path),
                        color: kcWhite,
                        size: 24.r,
                      ),
                      Text(
                        'Day 1',
                        style: TextStyles.buttonText.copyWith(
                          fontSize: 12,
                          color: kcWhite,
                          height: 1.66.h,
                        ),
                      ),
                    ],
                  ),
                ),
                // Coins part
                Padding(
                  padding: EdgeInsets.only(
                          right: _isPressed ? 10 : 20, top: 12, bottom: 12)
                      .r,
                  child: Row(
                    children: [
                      Text(
                        _isPressed ? 'Redeemed' : '500',
                        style: TextStyles.buttonText.copyWith(
                          fontSize: 12.sp,
                          color: kcSecondaryColor,
                          height: _isPressed ? 1.h : 1.66.h,
                        ),
                      ),
                      horizontalSpace(3),
                      _isPressed
                          ? const SizedBox()
                          : Image.asset(
                              Assets.icons.coin.path,
                              height: 18.h,
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom clipper for slashed background
class SlashedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.7, 0); // Start from the top
    path.lineTo(
        size.width, size.height); // Slash line to the bottom-right corner
    path.lineTo(0, size.height); // Bottom-left corner
    path.close(); // Complete the path
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
