import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/gen/fonts.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/action_banner.dart';
import 'package:isomorph_iq_nanda/ui/widgets/news_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/section_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/streak_redeem_card.dart';
import 'package:isomorph_iq_nanda/ui/widgets/user_status_card.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends StackedView<HomeViewModel> {
  const HomeViewDesktop({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 490.0).r,
                  child: Column(
                    children: [
                      Row(
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
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      kcPrimaryColor,
                                    ),
                                  ),
                                )
                              : UserStatusCard(
                                  name: viewModel
                                          .userProfile!.data!.telegramHandle ??
                                      'User',
                                  rank: viewModel.userRank!.data.rank,
                                ),
                          horizontalSpace08,
                          horizontalSpace04,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                              horizontalSpace04,
                              Image.asset(
                                Assets.icons.iqCoin.path,
                                width: 56.r,
                              )
                            ],
                          ),
                          horizontalSpace08,
                          horizontalSpace04,
                          StreakRedeemCard(
                            points: viewModel.streakPoints,
                            isRedeemed: viewModel.isRedeemedToday,
                            onRedeem: (tap) => viewModel.onClickStreakRedeem(),
                            isBusy: viewModel.busy("redeemingStreak"),
                          ),
                        ],
                      ),
                      verticalSpace16,
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.r),
                          topRight: Radius.circular(32.r),
                        ),
                        child: Container(
                          height: 249.h,
                          color: kcPrimaryColorLight,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 185.h,
                                width: 150.w,
                                child: Image.asset(
                                    Assets.gifs.isomorphLogo.path,
                                    fit: BoxFit.cover),
                              ),
                              verticalSpace08,
                              verticalSpace04,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Welcome to',
                                    style: TextStyles.titlePrimary
                                        .copyWith(color: kcSecondaryColor),
                                  ),
                                  horizontalSpace08,
                                  Text(
                                    'IsomorphIQ',
                                    style: TextStyles.titlePrimary
                                        .copyWith(color: kcPrimaryColor),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      verticalSpace16,
                      verticalSpace08,
                      verticalSpace04,
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
                              'Connect your X account to activate your Twitter Agent',
                              style: TextStyles.titleSecondary
                                  .copyWith(color: kcWhite)),
                          buttonLabel: 'Connect',
                          actionBannerColor: kcSecondaryColor,
                          onButtonPressed: viewModel.navigateToSources,
                        ),
                      verticalSpace36,
                      Row(
                        children: [
                          Container(
                            height: 180.h,
                            width: 450.w,
                            color: kcPrimaryColorLight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 24.0)
                                      .r,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Twitter Tools',
                                    style: TextStyles.titleSecondary
                                        .copyWith(color: kcSecondaryColor),
                                  ),
                                  verticalSpace16,
                                  verticalSpace08,
                                  verticalSpace04,
                                  Row(
                                    children: [
                                      Container(
                                        height: 88.h,
                                        width: 94.w,
                                        color: kcWhite,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              Assets.icons.iqCoin.path,
                                              width: 56.r,
                                            ),
                                            verticalSpace04,
                                            Text(
                                              'Generate Tweet',
                                              style: TextStyles.titleTertiary
                                                  .copyWith(
                                                      color: kcSecondaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
