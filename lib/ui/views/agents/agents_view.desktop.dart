import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/action_banner.dart';
import 'package:isomorph_iq_nanda/ui/widgets/streak_redeem_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/user_status_card.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewDesktop extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace36,
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: UserStatusCard(
                      name:
                          viewModel.userProfile?.data?.telegramHandle ?? 'User',
                      rank: viewModel.userRank?.data.rank ?? 0,
                    ),
                  ),
                  horizontalSpace08,
                  horizontalSpace04,
                  _pointsCard(viewModel),
                  horizontalSpace08,
                  horizontalSpace04,
                  StreakRedeemCard(
                    points: viewModel.streakPoints,
                    isRedeemed: viewModel.isRedeemedToday,
                    onRedeem: (_) => viewModel.onClickStreakRedeem(),
                    isBusy: viewModel.busy("redeemingStreak"),
                  ),
                ],
              ),
              verticalSpace36,
              Container(
                width: double.infinity,
                height: 218.h,
                decoration: BoxDecoration(
                  color: kcPrimaryColorLight,
                  borderRadius: BorderRadius.circular(32.r),
                ),
                padding: EdgeInsets.symmetric(vertical: 52.h, horizontal: 24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Your AI ',
                              style: TextStyles.titlePrimary.copyWith(
                                color: kcSecondaryColor,
                                fontSize: 24.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Agents',
                                  style: TextStyles.titlePrimary.copyWith(
                                    color: kcPrimaryColor,
                                    fontSize: 24.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpace08,
                          Text(
                            'Use IQ powered AI Personas that can empower you by\ndoing a range of daily tasks on behalf of you',
                            style: TextStyles.bodyPrimary.copyWith(
                                color: kcSecondaryColor, fontSize: 18.sp),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kcPrimaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                      onPressed: viewModel.navigateToAgentSettings,
                      icon: Icon(Icons.settings, size: 18.sp, color: kcWhite),
                      label: Text(
                        'Agent settings',
                        style: TextStyles.bodyPrimary.copyWith(
                          color: kcWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace36,
              ActionBanner(
                leading: Image.asset(
                  Assets.images.twitterToolsDesktop.path,
                  height: 40.h,
                ),
                text: Text(
                  'Connect your X account to activate your Twitter Agent',
                  style: TextStyles.titleSecondary.copyWith(color: kcWhite),
                ),
                buttonLabel: 'Connect',
                actionBannerColor: kcSecondaryColor,
                onButtonPressed: viewModel.navigateToSources,
              ),
              verticalSpace36,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: viewModel.navigateToTweetPersona,
                      child: Container(
                        height: 180.h,
                        width: 450.w,
                        padding: EdgeInsets.only(
                            left: 24.r, top: 24.r, bottom: 24.r),
                        decoration: BoxDecoration(
                          color: kcPrimaryColorLight,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -20,
                              top: 0,
                              bottom: 0,
                              child: Image.asset(
                                Assets.images.twitterToolsDesktop.path,
                                scale: 1.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Twitter Tools',
                                  style: TextStyles.titleSecondary.copyWith(
                                      color: kcSecondaryColor, fontSize: 20.sp),
                                ),
                                verticalSpace16,
                                Row(
                                  children: [
                                    _toolCard(
                                      icon: Icons.edit,
                                      label: 'Generate\nTweet',
                                    ),
                                    horizontalSpace08,
                                    _toolCard(
                                      icon: Icons.tag,
                                      label: 'Tagged\nTweets',
                                    ),
                                    horizontalSpace08,
                                    _toolCard(
                                      icon: Icons.reply,
                                      label: 'Generate\nReply',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  horizontalSpace16,
                  Expanded(
                    child: GestureDetector(
                      onTap: viewModel.navigateToCryptoNews,
                      child: Container(
                        height: 180.h,
                        width: 450.w,
                        padding: EdgeInsets.only(
                            left: 24.r, top: 24.r, bottom: 24.r),
                        decoration: BoxDecoration(
                          color: kcPrimaryColorLight,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: -20,
                              top: 0,
                              bottom: 0,
                              child: Image.asset(
                                Assets.images.cryptoNewsDesktop.path,
                                height: 150.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Crypto News',
                                  style: TextStyles.titleSecondary.copyWith(
                                      color: kcSecondaryColor, fontSize: 20.sp),
                                ),
                                verticalSpace16,
                                verticalSpace08,
                                SizedBox(
                                  width: 163.w,
                                  child: Text(
                                    'Monitor AI-curated news matching your interests!',
                                    style: TextStyles.bodyPrimary.copyWith(
                                        color: kcSecondaryColor,
                                        fontSize: 16.sp),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace16,
              verticalSpace08,
              Container(
                height: 72.h,
                color: kcPrimaryColorLight,
                child: Center(
                  child: Text(
                    'Many more agents coming soon!',
                    style: TextStyles.bodyPrimary.copyWith(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              verticalSpace36,
              _smallCard(
                onTap: viewModel.navigateToSources,
                title: 'Data Sources',
                subtitle: 'Connect your accounts to earn points and train IQ!',
                icon: Icons.arrow_forward,
              ),
              verticalSpace36,
            ],
          ),
        ),
      ),
    );
  }

  Widget _pointsCard(AgentsViewModel viewModel) {
    return Container(
      width: 118.w,
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: kcStrokeSecondary),
        boxShadow: const [
          BoxShadow(color: kcStrokePrimary, offset: Offset(0, 1)),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            viewModel.totalEarned.toString(),
            style: TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
          ),
          horizontalSpace04,
          Image.asset(Assets.icons.iqCoin.path, width: 24.w),
        ],
      ),
    );
  }

  Widget _toolCard({required IconData icon, required String label}) {
    return SizedBox(
      width: 100.w,
      child: Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          children: [
            Icon(icon, size: 28.sp, color: kcPrimaryColor),
            verticalSpace04,
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
            ),
          ],
        ),
      ),
    );
  }

  Widget _smallCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 114.h,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: kcStrokeSecondary),
          boxShadow: const [
            BoxShadow(color: kcStrokePrimary, offset: Offset(0, 1)),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyles.titleSecondary
                          .copyWith(color: kcSecondaryColor, fontSize: 20.sp)),
                  verticalSpace08,
                  SizedBox(
                    width: 202.w,
                    child: Text(subtitle,
                        style: TextStyles.bodyPrimary.copyWith(
                            color: kcSecondaryColor, fontSize: 16.sp)),
                  ),
                ],
              ),
            ),
            Container(
              width: 53.w,
              height: 51.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: kcPrimaryColor,
              ),
              child: Icon(icon, color: kcWhite, size: 24.r),
            ),
          ],
        ),
      ),
    );
  }
}
