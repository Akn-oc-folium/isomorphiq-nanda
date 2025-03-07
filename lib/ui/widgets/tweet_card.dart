import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/models/tweets_model.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/views/twitter_persona/twitter_persona_viewmodel.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

class TweetCard extends ViewModelWidget<TwitterPersonaViewModel> {
  final Tweet tweet;

  const TweetCard({
    super.key,
    required this.tweet,
  });

  @override
  Widget build(BuildContext context, TwitterPersonaViewModel viewModel) {
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
            'Tweet #${tweet.id.split('-').first}',
            maxLines: 1,
            style: TextStyles.buttonText.copyWith(color: kcSecondaryColor),
          ),
          verticalSpace08,
          Text(
            tweet.tweetContent,
            style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
          ),
          if (tweet.tweetStatus != TweetStatus.approved.name.toUpperCase()) ...[
            verticalSpace08,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SecondaryButton.icon(
                  icon: SvgPicture.asset(
                    Assets.icons.trash,
                    height: 24.r,
                    colorFilter: const ColorFilter.mode(
                        kcSecondaryColor, BlendMode.srcIn),
                  ),
                  onPressed: () => viewModel.updateTweetStatus(
                      tweet.id, TweetStatus.rejected.name.toUpperCase()),
                ),
                horizontalSpace16,
                Expanded(
                  child: PrimaryButton(
                    text: "Tweet Now",
                    onPressed: () => viewModel.updateTweetStatus(
                        tweet.id, TweetStatus.approved.name.toUpperCase()),
                    isBusy: viewModel.busy('updatingTweetStatus'),
                  ),
                )
              ],
            ),
          ],
        ],
      ),
    );
  }
}
