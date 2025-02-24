import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/models/tweet_model.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
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
                appBar: AppBar(
                  backgroundColor: kcWhite,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: viewModel.navigateBack,
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.settings))
                  ],
                ),
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Twitter Persona",
                        style: TextStyles.titlePrimary,
                      ),
                      Text(
                        'Use your personal AI Twitter Persona to generate tweets and replies for you!',
                        style: TextStyles.titleTertiary,
                      ),
                      SizedBox(height: 20),
                      PrimaryButton(text: "Generate Tweet", onPressed: () {}),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Generated Tweets',
                            style: TextStyles.titleSecondary
                                .copyWith(color: kcSecondaryColor),
                          ),
                          Icon(Icons.filter_list, color: Colors.black54),
                        ],
                      ),
                      SizedBox(height: 10),
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
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
            style: TextStyles.titleSecondary,
          ),
          SizedBox(height: 6),
          Text(
            tweet.content,
            style: TextStyles.bodyPrimary,
          ),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton.icon(
                  icon: SvgPicture.asset(
                    Assets.icons.arrowRight,
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {}),
              const SizedBox(width: 20),
              Expanded(
                  child: PrimaryButton(text: "Tweet Now", onPressed: () {}))
            ],
          ),
        ],
      ),
    );
  }
}
