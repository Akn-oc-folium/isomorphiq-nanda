import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/custom_app_bar.dart';
import 'package:isomorph_iq_nanda/ui/widgets/tagged_tweet_card_mobile.dart';
import 'package:stacked/stacked.dart';

import 'tagged_tweet_viewmodel.dart';

class TaggedTweetViewMobile extends StatelessWidget {
  const TaggedTweetViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaggedTweetViewModel>.reactive(
      viewModelBuilder: () => TaggedTweetViewModel(),
      onViewModelReady: (viewModel) => viewModel.loadTaggedTweets(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            context: context,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace08,
                Text(
                  'Tagged Tweets',
                  style: TextStyles.titlePrimary.copyWith(
                    color: kcSecondaryColor,
                    fontSize: 20.sp,
                  ),
                ),
                verticalSpace04,
                Text(
                  'Choose a tagged tweet to start discussion',
                  style: TextStyles.bodyPrimary.copyWith(
                    color: kcSecondaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                verticalSpace16,
                if (viewModel.busy('fetchingTagged')) ...[
                  Expanded(
                    child: Center(
                      child: CircularProgressIndicator(color: kcPrimaryColor),
                    ),
                  ),
                ] else if (viewModel.taggedTweets.isEmpty) ...[
                  Expanded(
                    child: Center(
                      child: Text(
                        "No tagged tweets found.",
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
                      itemCount: viewModel.taggedTweets.length,
                      itemBuilder: (context, index) {
                        final tweet = viewModel.taggedTweets[index];
                        return TaggedTweetMobileCard(
                          handle: tweet.user,
                          tweet: tweet.content,
                          onTap: () => viewModel.openGeneratedTweetModal(tweet),
                        );
                      },
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
