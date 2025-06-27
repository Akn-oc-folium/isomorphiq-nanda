import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/task_card.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewMobile extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewMobile({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI Agents',
                  style:
                      TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
                ),
                verticalSpace08,
                Text(
                  'Use IsomorphIQ AI Personas that enhance your interactions with the world around you.',
                  style: TextStyles.titleTertiary
                      .copyWith(color: kcSecondaryColor),
                ),
                verticalSpace04,
                verticalSpace16,
                _SubscriptionCard(),
                verticalSpace04,
                verticalSpace16,
                TaskCard.description(
                  title: 'Twitter Persona',
                  description:
                      'Create a unique Twitter Clone that tweets for you!',
                  imagePath: Assets.icons.xLogoOutline,
                  onTap: () => viewModel.onTwitterPersonaPressed(),
                ),
                verticalSpace16,
                TaskCard.description(
                  title: 'AI Persona',
                  description:
                      'Customize the tone and style of your AI Persona.',
                  imagePath: Assets.icons.aiPersona,
                  onTap: () => viewModel.onAIPersonaPressed(),
                ),
                verticalSpace16,
                TaskCard.description(
                  title: 'Crypto News',
                  description:
                      'Monitor AI-curated news that matches your interests!',
                  imagePath: Assets.icons.news,
                  onTap: () => viewModel.onCryptoNewsPressed(),
                ),
                verticalSpace04,
                verticalSpace16,
                Container(
                  width: double.infinity,
                  height: 72.h,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Many more agents coming soon!',
                      style: TextStyles.bodyPrimary.copyWith(
                        color: kcPrimaryColor,
                        fontWeight: FontWeight.w600,
                        height: 1.1428.h,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SubscriptionCard extends ViewModelWidget<AgentsViewModel> {
  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12).r,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF652C46), Color(0xFFDC4A26)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.55, 1.0],
        ),
        borderRadius: BorderRadius.circular(12).r,
      ),
      child: Row(
        children: [
          horizontalSpace08,
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pro Agent Plan',
                  style: TextStyles.titleSecondary
                      .copyWith(color: kcPrimaryColorLight),
                ),
                verticalSpace04,
                Text(
                  '3 day trial • 50 credits left',
                  style: TextStyles.titleTertiary.copyWith(
                    color: kcPrimaryColorLight,
                    fontSize: 12,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          FilledButton.tonal(
            onPressed: () => viewModel.onPlanUpgradePressed(),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.white.withValues(alpha: 0.16),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8).r,
              ),
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 12).r,
            ),
            child: Text(
              'Upgrade',
              style:
                  TextStyles.titleTertiary.copyWith(color: kcPrimaryColorLight),
            ),
          ),
        ],
      ),
    );
  }
}
