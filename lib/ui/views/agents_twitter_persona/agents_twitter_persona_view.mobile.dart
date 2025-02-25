import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/models/tweet_model.dart';
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
                      onPressed: () {},
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Twitter Persona",
                        style: TextStyles.titlePrimary
                            .copyWith(color: kcSecondaryColor),
                      ),
                      verticalSpace08,
                      Text(
                        'Use your personal AI Twitter Persona to generate tweets and replies for you!',
                        style: TextStyles.titleTertiary
                            .copyWith(color: kcSecondaryColor),
                      ),
                      verticalSpace04,
                      verticalSpace08,
                      PrimaryButton(text: "Generate Tweet", onPressed: () {}),
                      verticalSpace04,
                      verticalSpace16,
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
                          SvgPicture.asset(
                            Assets.icons.sort,
                            height: 24.r,
                            colorFilter: const ColorFilter.mode(
                                kcSecondaryColor, BlendMode.srcIn),
                          ),
                        ],
                      ),
                      verticalSpace04,
                      verticalSpace08,
                      Expanded(
                        child: viewModel.isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ListView.builder(
                                itemCount: viewModel.tweets.length,
                                itemBuilder: (context, index) {
                                  final tweet = viewModel.tweets[index];
                                  return _buildTweetCard(tweet, viewModel);
                                },
                              ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  Widget _buildTweetCard(Tweet tweet, AgentsTwitterPersonaViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8).h,
      padding: const EdgeInsets.all(12).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12).r,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${tweet.type} #${tweet.id}',
            style: TextStyles.buttonText.copyWith(color: kcSecondaryColor),
          ),
          verticalSpace08,
          Text(
            tweet.content,
            style: TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
          ),
          verticalSpace08,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton.icon(
                  icon: SvgPicture.asset(Assets.icons.trash,
                      height: 24.r,
                      colorFilter:
                          const ColorFilter.mode(kcWhite, BlendMode.srcIn)),
                  onPressed: () {}),
              horizontalSpace16,
              Expanded(
                child: PrimaryButton(
                  text: "Tweet Now",
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
