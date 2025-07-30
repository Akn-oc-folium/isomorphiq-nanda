import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/action_banner.dart';
import 'package:isomorph_iq_nanda/ui/widgets/feature_card.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (viewModel) => viewModel.refreshData(),
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: kcWhite,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(12.r),
                        decoration: BoxDecoration(
                          color: kcWhite,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                              color: kcPrimaryColor.withOpacity(0.3)),
                        ),
                        child: Row(
                          children: [
                            Image.asset(Assets.icons.avatar.path, width: 24.w),
                            horizontalSpace08,
                            horizontalSpace04,
                            Text(
                                viewModel.userProfile?.data?.telegramHandle ??
                                    'User',
                                style: TextStyles.titleSecondary.copyWith(
                                    color: kcSecondaryColor, fontSize: 18.sp)),
                            Spacer(),
                            Icon(
                              Icons.settings,
                              color: kcSecondaryColor,
                            )
                          ],
                        ),
                      ),
                      verticalSpace08,
                      verticalSpace04,
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: kcSecondaryColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Talk to Your Agent',
                                style: TextStyles.titleSecondary
                                    .copyWith(color: kcWhite, fontSize: 16.sp)),
                            verticalSpace04,
                            Text(
                                'Ask anything, get help, or let it handle stuff for you.',
                                style: TextStyles.bodyPrimary
                                    .copyWith(color: kcWhite)),
                            verticalSpace08,
                            GestureDetector(
                              onTap: () {},
                              child: Row(
                                children: [
                                  Text('Open Personal Chat',
                                      style: TextStyles.bodyPrimary.copyWith(
                                          color: kcPrimaryColor,
                                          fontWeight: FontWeight.bold)),
                                  horizontalSpace04,
                                  Icon(Icons.arrow_forward,
                                      size: 18.sp, color: kcPrimaryColor),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace08,
                      verticalSpace04,
                      Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: kcPrimaryColorLight.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recent Conversations',
                                style: TextStyles.titleSecondary
                                    .copyWith(color: kcSecondaryColor)),
                            verticalSpace04,
                            Text(
                                'Pick up where you left off or check on updates.',
                                style: TextStyles.bodyPrimary
                                    .copyWith(color: kcSecondaryColor)),
                            verticalSpace08,
                            verticalSpace04,
                            Wrap(
                              spacing: 8.w,
                              runSpacing: 8.h,
                              children:
                                  viewModel.recentConversations.map((conv) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.w, vertical: 10.h),
                                  decoration: BoxDecoration(
                                    color: kcWhite,
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                        color: kcPrimaryColor.withOpacity(0.4)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset(Assets.icons.iqCoin.path,
                                          width: 20.w),
                                      horizontalSpace08,
                                      Text(conv.name,
                                          style: TextStyles.bodyPrimary
                                              .copyWith(
                                                  color: kcSecondaryColor)),
                                      if ((conv.unreadCount) > 0)
                                        Container(
                                          margin: EdgeInsets.only(left: 4.w),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6.w, vertical: 2.h),
                                          decoration: BoxDecoration(
                                            color: kcPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                          ),
                                          child: Text(
                                            '${conv.unreadCount}',
                                            style: TextStyles.bodyPrimary
                                                .copyWith(
                                                    color: kcWhite,
                                                    fontSize: 12.sp),
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      verticalSpace08,
                      verticalSpace04,
                      Row(
                        children: [
                          Expanded(
                            child: FeatureCard(
                              title: 'News Insights',
                              assetPath: Assets.images.cryptoNewsDesktop.path,
                              onTap: viewModel.navigateToCryptoNews,
                            ),
                          ),
                          horizontalSpace08,
                          Expanded(
                            child: FeatureCard(
                              title: 'Twitter Tools',
                              assetPath: Assets.images.twitterToolsDesktop.path,
                              onTap: viewModel.navigateToTweetPersona,
                            ),
                          ),
                        ],
                      ),
                      verticalSpace08,
                      verticalSpace04,
                      ActionBanner(
                        leading:
                            Image.asset(Assets.icons.xLogo.path, height: 40.h),
                        text: Text(
                          'Connect your X account to activate your Twitter Agent',
                          style:
                              TextStyles.bodyPrimary.copyWith(color: kcWhite),
                        ),
                        buttonLabel: '',
                        actionBannerColor: kcSecondaryColor,
                        onButtonPressed: viewModel.navigateToSources,
                      ),
                      verticalSpace16,
                      FeatureCard(
                        title: 'Data Sources',
                        subtitle:
                            'Connect your accounts to earn points and train IQ!',
                        onTap: viewModel.navigateToSources,
                      ),
                      verticalSpace16,
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
