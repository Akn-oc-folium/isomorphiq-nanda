import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/main_layout/main_layout_view.dart';
import 'package:isomorph_iq_nanda/ui/widgets/tagged_tweet_card.dart';
import 'package:stacked/stacked.dart';

import 'reply_tweet_viewmodel.dart';

class ReplyTweetViewDesktop extends ViewModelWidget<ReplyTweetViewModel> {
  const ReplyTweetViewDesktop({super.key});

  @override
  Widget build(BuildContext context, ReplyTweetViewModel viewModel) {
    return MainLayoutView(
      showRightPanel: viewModel.selectedTweetId != null ||
          viewModel.isModifyAccountsPanelVisible,
      rightPanel: viewModel.isModifyAccountsPanelVisible
          ? buildModifyAccountsPanel(viewModel)
          : viewModel.selectedTweetId != null
              ? buildReplyPanel(viewModel)
              : null,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
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
                  "Reply to Tweets",
                  style:
                      TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
                ),
                const Spacer(),
                TextButton(
                  onPressed: viewModel.toggleModifyAccountsPanel,
                  child: Row(
                    children: [
                      Text(
                        "Modify Accounts for Replies",
                        style: TextStyles.bodyPrimary
                            .copyWith(color: kcPrimaryColor),
                      ),
                      const Icon(Icons.edit, size: 16, color: kcPrimaryColor),
                    ],
                  ),
                )
              ],
            ),
            verticalSpace08,
            Text(
              "Choose a tweet to generate reply and post",
              style: TextStyles.bodyPrimary
                  .copyWith(color: kcSecondaryColor, fontSize: 18),
            ),
            verticalSpace16,
            Expanded(
              child: ListView.separated(
                itemCount: viewModel.taggedTweets.length,
                separatorBuilder: (_, __) => verticalSpace16,
                itemBuilder: (context, index) {
                  final tweet = viewModel.taggedTweets[index];
                  return TaggedTweetCard(
                    user: tweet.user,
                    content: tweet.content,
                    buttonText: "Reply to tweet",
                    points: 5,
                    onPrimaryAction: () => viewModel.startReply(tweet.id),
                    onDelete: () => viewModel.deleteTweet(tweet.id),
                    isSelected: tweet.id == viewModel.selectedTweetId,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildReplyPanel(ReplyTweetViewModel viewModel) {
    final selectedTweet = viewModel.taggedTweets.firstWhere(
      (t) => t.id == viewModel.selectedTweetId,
      orElse: () => TaggedTweet(id: '', user: '', content: ''),
    );

    if (selectedTweet.id.isEmpty) {
      return SizedBox();
    }

    return Container(
      color: kcWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedTweet.user,
            style: TextStyles.titleTertiary.copyWith(
              color: kcSecondaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
          verticalSpace08,
          Text(
            selectedTweet.content,
            style: TextStyles.bodyPrimary.copyWith(
              color: kcSecondaryColor,
              fontSize: 16.sp,
              height: 1.4,
            ),
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.only(bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: viewModel.replyController,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Input a topic you want to reply with...",
                    hintStyle: TextStyles.bodyPrimary.copyWith(
                      color: kcSecondaryColor,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: kcPrimaryColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kcPrimaryColor),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.h,
                      horizontal: 16.w,
                    ),
                  ),
                ),
                verticalSpace08,
                verticalSpace04,
                Row(
                  children: [
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: const Icon(Icons.refresh, color: Colors.grey),
                    ),
                    horizontalSpace08,
                    horizontalSpace04,
                    Expanded(
                      child: SizedBox(
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: viewModel.generateReply,
                          child: Text(
                            "Generate Reply\n5 Credits",
                            textAlign: TextAlign.center,
                            style: TextStyles.titleTertiary
                                .copyWith(color: kcWhite),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildModifyAccountsPanel(ReplyTweetViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Modify Accounts to Reply",
                style: TextStyles.titlePrimary
                    .copyWith(color: kcSecondaryColor, fontSize: 24.sp),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: kcPrimaryColor),
                onPressed: viewModel.toggleModifyAccountsPanel,
              ),
            ],
          ),
          verticalSpace16,
          Text(
            "Selected Accounts",
            style: TextStyles.titleTertiary.copyWith(color: kcSecondaryColor),
          ),
          verticalSpace08,
          Wrap(
            spacing: 8.w,
            children: viewModel.selectedAccounts.map((account) {
              return Chip(
                label: Text(account),
                backgroundColor: kcPrimaryColor,
                labelStyle: TextStyle(color: Colors.white),
                deleteIcon: const Icon(Icons.close, color: Colors.white),
                onDeleted: () => viewModel.removeAccount(account),
              );
            }).toList(),
          ),
          verticalSpace16,
          buildCategorySection("Web3 and Crypto", viewModel.web3Crypto),
          verticalSpace16,
          buildCategorySection("AI and ML", viewModel.aiAndML),
          verticalSpace16,
          buildCategorySection("Crypto X AI", viewModel.cryptoXAI),
          verticalSpace16,
          TextField(
            controller: viewModel.handleInputController,
            decoration: InputDecoration(
              hintText: "Input specific handles",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kcPrimaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kcPrimaryColor),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.add, color: kcPrimaryColor),
                onPressed: viewModel.addHandle,
              ),
            ),
          ),
          verticalSpace16,
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kcPrimaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
              ),
              onPressed: viewModel.saveChanges,
              child: Text(
                "Save Changes",
                style: TextStyles.titleTertiary.copyWith(color: kcWhite),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategorySection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyles.titleTertiary.copyWith(color: kcSecondaryColor),
        ),
        verticalSpace08,
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: items
              .map((item) => Chip(
                    label: Text(item),
                    backgroundColor: kcPrimaryColorLight,
                    labelStyle: TextStyle(color: kcSecondaryColor),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
