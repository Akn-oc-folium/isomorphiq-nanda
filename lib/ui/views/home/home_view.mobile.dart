import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/gen/fonts.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/action_banner.dart';
import 'package:isomorph_iq_nanda/ui/widgets/level_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/news_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/section_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/streak_redeem_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/user_status_card.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends StackedView<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, child) {
    return FocusDetector(
      onFocusGained: () {
        // Refresh data when the screen regains focus
        viewModel.refreshData();
      },
      child: Scaffold(
        body: viewModel.isBusy || viewModel.userProfile == null
            ? Center(
                child: SizedBox(
                  height: 40.r,
                  width: 40.r,
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: kcPrimaryColor.withValues(alpha: 0.5),
                    strokeWidth: 2.0.w,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      kcPrimaryColor,
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0)
                      .r,
                  child: Column(
                    children: [
                      viewModel.userRank == null ||
                              viewModel.userRank!.data.rank == 0
                          ? SizedBox(
                              height: 20.r,
                              width: 20.r,
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor:
                                    kcPrimaryColor.withValues(alpha: 0.5),
                                strokeWidth: 2.0.w,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  kcPrimaryColor,
                                ),
                              ),
                            )
                          : UserStatusCard(
                              name:
                                  viewModel.userProfile!.data!.telegramHandle ??
                                      'User',
                              rank: viewModel.userRank!.data.rank,
                            ),
                      verticalSpace08,
                      verticalSpace04,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreakRedeemCard(
                            points: viewModel.streakPoints,
                            isRedeemed: viewModel.isRedeemedToday,
                            onRedeem: (tap) => viewModel.onClickStreakRedeem(),
                            isBusy: viewModel.busy("redeemingStreak"),
                          ),
                          LevelCard(
                              level: viewModel.userProfile!.data!.level ?? 1),
                        ],
                      ),
                      verticalSpace08,
                      verticalSpace16,
                      Text(
                        'Total Points Earned',
                        style: TextStyles.titleSecondary
                            .copyWith(color: kcSecondaryColor),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Assets.icons.iqCoin.path,
                            width: 56.r,
                          ),
                          horizontalSpace04,
                          Text(
                            viewModel.totalEarned.toString(),
                            style: TextStyle(
                              color: kcSecondaryColor,
                              fontSize: 44.r,
                              fontWeight: FontWeight.w600,
                              fontFamily: FontFamily.sora,
                              height: 1.8.h,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace08,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SectionCard(
                            title: 'Data Sources',
                            description:
                                'Connect & disconnect your data sources',
                            onTap: viewModel.navigateToSources,
                          ),
                          SectionCard(
                            title: 'AI Persona',
                            description:
                                'Customise the tone and style of your AI.',
                            onTap: viewModel.navigateToAiPersona,
                          ),
                        ],
                      ),
                      verticalSpace08,
                      verticalSpace16,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Crypto News',
                            style: TextStyles.titleSecondary
                                .copyWith(color: kcSecondaryColor),
                          ),
                          TextButton(
                            onPressed: viewModel.navigateToCryptoNews,
                            child: Text(
                              'View All',
                              style: TextStyles.bodyPrimary
                                  .copyWith(color: kcPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace08,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NewsCard(
                            headline: viewModel.busy('fetchingNews')
                                ? ''
                                : viewModel.newsList![0].headline!,
                            isLoading: viewModel.busy('fetchingNews'),
                            onReadMore: () => viewModel.readMore(0),
                          ),
                          NewsCard(
                            headline: viewModel.busy('fetchingNews')
                                ? ''
                                : viewModel.newsList![1].headline!,
                            isLoading: viewModel.busy('fetchingNews'),
                            onReadMore: () => viewModel.readMore(1),
                          ),
                        ],
                      ),
                      verticalSpace08,
                      verticalSpace16,
                      if (viewModel.xAuthTokenExists)
                        ActionBanner(
                          leading: Text(
                            (viewModel.tweetCount ?? 0).toString(),
                            style: TextStyles.titlePrimary
                                .copyWith(color: kcPrimaryColor),
                          ),
                          text: Text(
                            'Tweets Waiting for Your Review',
                            style: TextStyles.titleSecondary
                                .copyWith(color: kcSecondaryColor),
                          ),
                          buttonLabel: 'View All',
                          onButtonPressed: viewModel.navigateToTweetPersona,
                        )
                      else
                        ActionBanner(
                          leading: Image.asset(
                            Assets.icons.xLogo.path,
                            height: 40.r,
                            width: 40.r,
                          ),
                          text: Text(
                            'Connect your X account to activate the AI Agent',
                            style: TextStyles.bodySecondary
                                .copyWith(color: kcSecondaryColor),
                          ),
                          buttonLabel: 'Connect',
                          onButtonPressed: viewModel.navigateToSources,
                        )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
