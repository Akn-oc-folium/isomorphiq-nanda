import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/models/tweets_model.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:isomorph_iq/ui/widgets/custom_app_bar.dart';
import 'package:stacked/stacked.dart';

import 'agents_twitter_persona_viewmodel.dart';

class AgentsTwitterPersonaViewMobile extends StatelessWidget {
  const AgentsTwitterPersonaViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AgentsTwitterPersonaViewModel>.reactive(
      viewModelBuilder: () => AgentsTwitterPersonaViewModel(),
      onViewModelReady: (viewModel) => viewModel.fetchTweets(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            context: context,
            actions: [
              IconButton(
                onPressed: () => viewModel.navigateToSettings(),
                icon: SvgPicture.asset(
                  Assets.icons.settingsOutline,
                  height: 24.r,
                ),
                iconSize: 48.r,
              )
            ],
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
                      "Twitter Persona",
                      style: TextStyles.titlePrimary
                          .copyWith(color: kcSecondaryColor),
                    ),
                    verticalSpace08,
                    Text(
                      'Use IQ to interact with AI Agents, and level up your personal AI',
                      style: TextStyles.titleTertiary
                          .copyWith(color: kcSecondaryColor),
                    ),
                    verticalSpace04,
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
                    if (viewModel.busy(viewModel.tweets)) ...[
                      Expanded(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: kcPrimaryColor,
                          ),
                        ),
                      ),
                    ] else ...[
                      if (viewModel.tweets == null) ...[
                        Center(
                          child: Text(
                            "No Tweets Generated",
                            style: TextStyles.bodyPrimary.copyWith(
                              color: kcPrimaryColor,
                              fontSize: 16.sp,
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
                        Expanded(
                          child: ListView.builder(
                            itemCount: viewModel.tweets!.data.length,
                            itemBuilder: (context, index) {
                              final tweet = viewModel.tweets!.data[index];
                              return _buildTweetCard(tweet, viewModel);
                            },
                          ),
                        ),
                      ],
                    ],
                  ],
                ),
                Positioned(
                  right: 0,
                  top: 300,
                  child: viewModel.isFilterDropdownVisible
                      ? Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            width: 150,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
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

  Widget _buildTweetCard(Tweet tweet, AgentsTwitterPersonaViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16).h,
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        border: Border.all(color: kcStrokeSecondary),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tweet #${tweet.id}',
            maxLines: 1,
            style: TextStyles.buttonText.copyWith(color: kcSecondaryColor),
          ),
          verticalSpace08,
          Text(
            tweet.tweetContent,
            style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
          ),
          verticalSpace08,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SecondaryButton.icon(
                icon: SvgPicture.asset(
                  Assets.icons.trash,
                  height: 24.r,
                  colorFilter:
                      const ColorFilter.mode(kcSecondaryColor, BlendMode.srcIn),
                ),
                onPressed: () =>
                    viewModel.updateTweetStatus(tweet.id, 'REJECTED'),
              ),
              horizontalSpace16,
              Expanded(
                child: PrimaryButton(
                  text: "Tweet Now",
                  onPressed: () =>
                      viewModel.updateTweetStatus(tweet.id, 'APPROVED'),
                  isBusy: viewModel.busy('updatingTweetStatus'),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
