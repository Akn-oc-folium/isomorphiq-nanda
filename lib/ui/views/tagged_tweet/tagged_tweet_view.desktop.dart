import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/main_layout/main_layout_view.dart';
import 'package:isomorph_iq_nanda/ui/widgets/tagged_tweet_card.dart';
import 'package:stacked/stacked.dart';

import 'tagged_tweet_viewmodel.dart';

class TaggedTweetViewDesktop extends ViewModelWidget<TaggedTweetViewModel> {
  const TaggedTweetViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TaggedTweetViewModel viewModel) {
    return MainLayoutView(
      showRightPanel:
          viewModel.showFilterPanel || viewModel.showDiscussionPanel,
      rightPanel: viewModel.showFilterPanel
          ? buildFilterPanel(viewModel)
          : viewModel.showDiscussionPanel
              ? buildDiscussionPanel(viewModel)
              : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace36,
          Row(
            children: [
              IconButton(
                onPressed: viewModel.navigateBack,
                icon: Icon(Icons.arrow_back_outlined, size: 30.r),
                color: kcSecondaryColor,
              ),
              horizontalSpace04,
              Text(
                "Tagged Tweets",
                style:
                    TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: viewModel.toggleFilterPanel,
              ),
            ],
          ),
          verticalSpace08,
          Text(
            "Choose a tagged tweet to start discussion",
            style: TextStyles.bodyPrimary
                .copyWith(color: kcSecondaryColor, fontSize: 18),
          ),
          verticalSpace16,
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.taggedTweets.length,
              itemBuilder: (context, index) {
                final tweet = viewModel.taggedTweets[index];
                return TaggedTweetCard(
                  user: tweet.user,
                  content: tweet.content,
                  buttonText: "Generate Reply",
                  points: 5,
                  onPrimaryAction: () => viewModel.startDiscussion(tweet.id),
                  onDelete: () => viewModel.deleteTweet(tweet.id),
                  isSelected: tweet.id == viewModel.selectedTweetId,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Filter Panel Widget
  Widget buildFilterPanel(TaggedTweetViewModel viewModel) {
    return Container(
      color: kcWhite,
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filter by discussion topics",
                style: TextStyles.titleSecondary.copyWith(
                  color: kcSecondaryColor,
                  fontSize: 18,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: kcPrimaryColor),
                onPressed: viewModel.closePanel,
              ),
            ],
          ),
          verticalSpace16,

          /// Today section
          Text(
            "Today",
            style: TextStyles.titleTertiary.copyWith(
              color: kcSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace08,
          ...viewModel.todayOptions.map((option) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(option,
                      style: TextStyles.bodyPrimary
                          .copyWith(color: kcSecondaryColor)),
                ),
                Divider(color: kcPrimaryColorLight),
              ],
            );
          }).toList(),

          verticalSpace16,

          /// Previous 30 days section
          Text(
            "Previous 30 days",
            style: TextStyles.titleTertiary.copyWith(
              color: kcSecondaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          verticalSpace08,
          ...viewModel.previous30DaysOptions.map((option) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Text(option,
                      style: TextStyles.bodyPrimary
                          .copyWith(color: kcSecondaryColor)),
                ),
                Divider(color: kcPrimaryColorLight),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }

  /// Discussion Panel Widget
  Widget buildDiscussionPanel(TaggedTweetViewModel viewModel) {
    return Container(
      color: kcWhite,
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Start discussion",
                style: TextStyles.titlePrimary
                    .copyWith(color: kcSecondaryColor, fontSize: 24.sp),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: viewModel.closePanel,
              ),
            ],
          ),
          verticalSpace08,

          /// Current discussion prompt
          Text(
            viewModel.currentDiscussionPrompt,
            style: TextStyles.bodyPrimary
                .copyWith(color: kcSecondaryColor, fontSize: 20.sp),
          ),
          verticalSpace16,

          /// Chat messages list
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.chatMessages.length,
              itemBuilder: (context, index) {
                final message = viewModel.chatMessages[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: message.isUser
                            ? kcPrimaryColorLight
                            : kcPrimaryColorLight.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        message.text,
                        style: TextStyles.bodyPrimary
                            .copyWith(color: kcSecondaryColor, fontSize: 14.sp),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          verticalSpace16,

          /// Input field
          TextField(
            controller: viewModel.messageController,
            decoration: InputDecoration(
              hintText: "Ask anything...",
              border: OutlineInputBorder(),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: viewModel.sendDiscussionMessage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
