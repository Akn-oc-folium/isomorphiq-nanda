import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/main_layout/main_layout_view.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:isomorph_iq_nanda/ui/widgets/tweet_card_desktop.dart';
import 'package:stacked/stacked.dart';
import 'twitter_persona_viewmodel.dart';

class TwitterPersonaViewDesktop
    extends ViewModelWidget<TwitterPersonaViewModel> {
  const TwitterPersonaViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TwitterPersonaViewModel viewModel) {
    return MainLayoutView(
      showRightPanel: viewModel.selectedTweet != null,
      rightPanel: viewModel.selectedTweet != null
          ? Container(
              color: kcWhite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Edit Tweet #${viewModel.selectedTweet!.id.split('-').first}",
                        style: TextStyles.titlePrimary
                            .copyWith(color: kcSecondaryColor),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, color: kcSecondaryColor),
                        onPressed: viewModel.closeEditPanel,
                      ),
                    ],
                  ),
                  verticalSpace08,
                  TextField(
                    controller: viewModel.editTweetController,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 2,
                        child: PrimaryButton(
                          text: "Tweet Now",
                          points: 5,
                          onPressed: viewModel.updateEditedTweet,
                        ),
                      ),
                      horizontalSpace08,
                      horizontalSpace04,
                      Flexible(
                        flex: 1,
                        child: PrimaryButton.icon(
                            icon: Icon(Icons.delete), onPressed: () {}),
                      )
                    ],
                  ),
                ],
              ),
            )
          : null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace36,
          Row(
            children: [
              IconButton(
                onPressed: viewModel.navigateBack,
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 30.r,
                ),
                color: kcSecondaryColor,
              ),
              horizontalSpace04,
              Text(
                "Generate New Tweet",
                style:
                    TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
              ),
            ],
          ),
          verticalSpace16,
          Container(
            width: double.infinity,
            height: 80.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            decoration: BoxDecoration(
              border: Border.all(color: kcStrokePrimary, width: 1.w),
              borderRadius: BorderRadius.circular(8).r,
            ),
            child: TextField(
              controller: viewModel.topicController,
              readOnly: viewModel.isBusy,
              decoration: InputDecoration(
                isDense: true,
                isCollapsed: true,
                border: InputBorder.none,
                hintText: "Input topic you want to talk about...",
                hintStyle:
                    TextStyles.bodyPrimary.copyWith(color: kcPrimaryColor),
              ),
              textAlignVertical: TextAlignVertical.top,
              cursorColor: kcSecondaryColor,
              cursorHeight: 16.h,
              style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
              onChanged: (_) => viewModel.notifyListeners(),
            ),
          ),
          verticalSpace16,
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: 313,
              child: PrimaryButton(
                text: "Generate Tweet",
                points: 5,
                onPressed: viewModel.topicController.text.isEmpty
                    ? null
                    : viewModel.generateTweet,
                isBusy: viewModel.busy('generatingTweet'),
              ),
            ),
          ),
          verticalSpace36,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pre-Generated Tweets",
                style: TextStyles.titleSecondary
                    .copyWith(color: kcSecondaryColor, fontSize: 24.sp),
              ),
              IconButton(onPressed: null, icon: Icon(Icons.sort))
            ],
          ),
          verticalSpace08,
          Text(
            "Choose a tweet to edit, remove or post from here",
            style: TextStyles.bodyPrimary
                .copyWith(color: kcSecondaryColor, fontSize: 20),
          ),
          verticalSpace16,
          if (viewModel.busy("tweetsFetching"))
            Center(
              child: CircularProgressIndicator(color: kcPrimaryColor),
            )
          else if (viewModel.tweets.isEmpty)
            Center(
              child: Text(
                "No Tweets Generated",
                style: TextStyles.bodyPrimary.copyWith(
                  color: kcPrimaryColor,
                  fontSize: 16.sp,
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: viewModel.tweets.length,
                itemBuilder: (context, index) {
                  final tweet = viewModel.tweets[index];
                  return TweetCardDesktop(
                    tweet: tweet,
                    onEdit: () => viewModel.selectTweetForEdit(tweet),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
