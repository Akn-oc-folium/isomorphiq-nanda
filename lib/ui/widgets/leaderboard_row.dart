import 'package:flutter/material.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';

class LeaderboardRow extends StatelessWidget {
  final int index;
  final String name;
  final int score;

  const LeaderboardRow({
    super.key,
    required this.index,
    required this.name,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFE6BD62),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  '$index',
                  style: const TextStyle(
                    color: Color(0xFF652C46),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              horizontalSpace08,
              // Center column: Icon + Name
              Container(
                height: 32,
                decoration: BoxDecoration(
                  color: kcStrokePrimary,
                  borderRadius: BorderRadius.circular(6),
                ),
                alignment: Alignment.center,
                child: Assets.icons.avatar.image(
                  width: 24,
                  height: 24,
                  fit: BoxFit.contain,
                ),
              ),
              horizontalSpace08,
              Text(
                name,
                style: TextStyles.titleSecondary.copyWith(
                  color: kcSecondaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Assets.icons.coin.image(
                height: 17,
                fit: BoxFit.contain,
              ),
              horizontalSpace04,
              Text(
                '$score',
                style: TextStyles.caption.copyWith(
                  color: kcSecondaryColor,
                  fontSize: 12,
                  height: 1.789,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
