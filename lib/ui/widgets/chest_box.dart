import 'package:flutter/material.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class ChestBox extends StatelessWidget {
  final String? imagePath;
  final int? points;

  const ChestBox({super.key, required this.imagePath, this.points});

  @override
  Widget build(BuildContext context) {
    return (points == null)
        ? Container(
            alignment: Alignment.center,
            width: 58,
            height: 82,
            decoration: BoxDecoration(
              color: kcPrimaryColorLight,
              border: Border.all(color: kcStrokeSecondary),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: kcStrokePrimary,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Text(
              'Chest\nSlot',
              style: TextStyles.titleTertiary.copyWith(
                color: kcSecondaryColor.withValues(alpha: 0.4),
                fontSize: 8,
                height: 1.111,
              ),
              textAlign: TextAlign.center,
            ),
          )
        : Container(
            alignment: Alignment.center,
            height: 82,
            width: 58,
            padding:
                const EdgeInsets.only(left: 4, top: 4, right: 4, bottom: 6),
            decoration: BoxDecoration(
              color: kcPrimaryColorLight,
              gradient: RadialGradient(
                colors: [
                  const Color(0xFFFFC300).withValues(alpha: 0.3),
                  kcPrimaryColorLight,
                ],
                center: Alignment.center,
                focalRadius: 1.0,
                radius: 0.6,
              ),
              border: Border.all(color: kcStrokeSecondary),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: kcStrokePrimary,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              children: [
                Image.asset(
                  imagePath!,
                  width: 44,
                  height: 44,
                ),
                verticalSpace(5),
                _ChestCoinsWidget(points: points!)
              ],
            ),
          );
  }
}

class _ChestCoinsWidget extends StatelessWidget {
  final int points;

  const _ChestCoinsWidget({required this.points});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      width: 52,
      height: 20,
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: kcStrokePrimary, width: 0.6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.coin.image(width: 12),
          horizontalSpace04,
          Text(
            points.toString(),
            style: TextStyles.titleTertiary.copyWith(
              fontSize: 8,
              height: 1.1111,
              color: kcSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
