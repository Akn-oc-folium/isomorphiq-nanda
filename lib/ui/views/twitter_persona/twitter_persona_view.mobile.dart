import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:isomorph_iq_nanda/ui/widgets/custom_app_bar.dart';
import 'package:isomorph_iq_nanda/ui/widgets/tweet_card.dart';
import 'package:stacked/stacked.dart';

import 'twitter_persona_viewmodel.dart';

class TwitterPersonaViewMobile extends StatelessWidget {
  const TwitterPersonaViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TwitterPersonaViewModel>.reactive(
      viewModelBuilder: () => TwitterPersonaViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialize(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            context: context,
            // actions: [
            //   IconButton(
            //     onPressed: () => viewModel.navigateToSettings(),
            //     icon: SvgPicture.asset(
            //       Assets.icons.settingsOutline,
            //       height: 24.r,
            //     ),
            //     iconSize: 48.r,
            //   )
            // ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24).w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Generate New Tweet",
                      style: TextStyles.titlePrimary
                          .copyWith(color: kcSecondaryColor, fontSize: 20.sp),
                    ),
                    verticalSpace08,
                    Container(
                      width: double.infinity,
                      height: 80.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 10.h),
                      decoration: BoxDecoration(
                        border: Border.all(color: kcStrokePrimary, width: 1.w),
                        borderRadius: BorderRadius.circular(8).r,
                      ),
                      child: TextField(
                        controller: viewModel.topicController,
                        readOnly: viewModel.isBusy ? true : false,
                        decoration: InputDecoration(
                          isDense: true,
                          isCollapsed: true,
                          border: InputBorder.none,
                          hintText: "Input topic you want to talk about...",
                          hintStyle: TextStyles.bodyPrimary
                              .copyWith(color: kcPrimaryColor),
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        cursorColor: kcSecondaryColor,
                        cursorHeight: 16.h,
                        style: TextStyles.bodyPrimary
                            .copyWith(color: kcSecondaryColor),
                        onChanged: (value) => viewModel.notifyListeners(),
                      ),
                    ),
                    verticalSpace04,
                    verticalSpace08,
                    PrimaryButton(
                      text: "Generate Tweet",
                      onPressed: viewModel.topicController.text.isEmpty
                          ? null
                          : viewModel.generateTweet,
                      isBusy: viewModel.busy('generatingTweet'),
                    ),
                    verticalSpace04,
                    verticalSpace16,
                    if (viewModel.busy("tweetsFetching")) ...[
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
                    ] else ...[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Generated Tweets',
                            style: TextStyles.titleSecondary.copyWith(
                              color: kcSecondaryColor,
                              fontSize: 18.sp,
                              height: 1.h,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => viewModel.toggleFilterDropdown(),
                            child: SvgPicture.asset(
                              Assets.icons.sort,
                              height: 24.r,
                              colorFilter: const ColorFilter.mode(
                                  kcSecondaryColor, BlendMode.srcIn),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace04,
                      verticalSpace08,
                      if (viewModel.tweets.isEmpty) ...[
                        Expanded(
                          child: Center(
                            child: Text(
                              "No Tweets Generated",
                              style: TextStyles.bodyPrimary.copyWith(
                                color: kcPrimaryColor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: ListView.builder(
                            physics: ClampingScrollPhysics(),
                            itemCount: viewModel.tweets.length,
                            itemBuilder: (context, index) {
                              final tweet = viewModel.tweets[index];
                              return TweetCard(tweet: tweet);
                            },
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 300.h,
                  child: viewModel.isFilterDropdownVisible
                      ? Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 150.w,
                            padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8)
                                .r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8).r,
                              color: Colors.white,
                            ),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: viewModel.filterOptions.length,
                              itemBuilder: (context, index) {
                                String option = viewModel.filterOptions[index];
                                bool isSelected =
                                    viewModel.selectedFilter == option;
                                return Column(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () =>
                                          viewModel.applyFilter(option),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(option,
                                              style: TextStyles.bodyPrimary
                                                  .copyWith(
                                                      color: kcPrimaryColor)),
                                          Container(
                                            width: 15,
                                            height: 15,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: kcPrimaryColor,
                                                  width: 3),
                                              color: isSelected
                                                  ? kcPrimaryColor
                                                  : Colors.white,
                                            ),
                                            child: isSelected
                                                ? Icon(Icons.check,
                                                    color: Colors.white,
                                                    size: 8)
                                                : null,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (index !=
                                        viewModel.filterOptions.length - 1)
                                      Divider(
                                        color: kcPrimaryColorAccent.withValues(
                                            alpha: 0.2),
                                        thickness: 1,
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                        )
                      : SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
