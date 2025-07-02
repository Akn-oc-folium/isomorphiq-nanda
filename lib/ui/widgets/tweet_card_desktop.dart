import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/models/tweets_model.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/app_constants.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/twitter_persona/twitter_persona_viewmodel.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

class TweetCardDesktop extends ViewModelWidget<TwitterPersonaViewModel> {
  final Tweet tweet;
  final VoidCallback onEdit;

  const TweetCardDesktop({
    super.key,
    required this.tweet,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context, TwitterPersonaViewModel viewModel) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Tweet #${tweet.id.split('-').first}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.titleSecondary.copyWith(
                    color: kcSecondaryColor,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 194.w,
                    height: 56.h,
                    child: PrimaryButton(
                      text: "Tweet Now",
                      points: 5,
                      onPressed: () => viewModel.updateTweetStatus(
                        tweet.id,
                        TweetStatus.approved.name.toUpperCase(),
                      ),
                      isBusy: viewModel.busy(
                        'updatingTweetStatus${tweet.id.split('-').first}',
                      ),
                    ),
                  ),
                  horizontalSpace08,
                  PrimaryButton.icon(
                    icon: Icon(Icons.edit),
                    onPressed: onEdit,
                  ),
                  horizontalSpace08,
                  PrimaryButton.icon(
                    onPressed: () => viewModel.updateTweetStatus(
                      tweet.id,
                      TweetStatus.rejected.name.toUpperCase(),
                    ),
                    icon: SvgPicture.asset(
                      Assets.icons.trash,
                      color: kcSecondaryColor,
                      height: 24.r,
                    ),
                  )
                ],
              ),
            ],
          ),
          verticalSpace16,
          Text(
            tweet.tweetContent,
            style: TextStyles.bodyPrimary.copyWith(
              color: kcSecondaryColor,
              fontSize: 16.sp,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
