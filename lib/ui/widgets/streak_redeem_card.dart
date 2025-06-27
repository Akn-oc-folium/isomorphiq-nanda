import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';

class StreakRedeemCard extends StatelessWidget {
  final ValueChanged<bool>? onRedeem;
  final int points;
  final bool isRedeemed;
  final bool isBusy;

  const StreakRedeemCard({
    super.key,
    required this.onRedeem,
    required this.points,
    required this.isRedeemed,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isRedeemed ? null : () => onRedeem?.call(true),
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
                // Day part
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
                // Coins / Redeemed part
                Padding(
                  padding: EdgeInsets.only(
                          right: isRedeemed ? 10 : 20, top: 12, bottom: 12)
                      .r,
                  child: isBusy
                      ? SizedBox(
                          height: 14.r,
                          width: 14.r,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: kcSecondaryColor,
                          ),
                        )
                      : Row(
                          children: [
                            Text(
                              isRedeemed ? 'Redeemed' : '$points',
                              style: TextStyles.buttonText.copyWith(
                                fontSize: 12.sp,
                                color: kcSecondaryColor,
                                height: isRedeemed ? 1.h : 1.66.h,
                              ),
                            ),
                            horizontalSpace(3),
                            isRedeemed
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

class SlashedBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width * 0.7, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
