import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'reply_tweet_view.desktop.dart';
import 'reply_tweet_view.tablet.dart';
import 'reply_tweet_view.mobile.dart';
import 'reply_tweet_viewmodel.dart';

class ReplyTweetView extends StackedView<ReplyTweetViewModel> {
  const ReplyTweetView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ReplyTweetViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ReplyTweetViewMobile(),
      tablet: (_) => const ReplyTweetViewTablet(),
      desktop: (_) => const ReplyTweetViewDesktop(),
    );
  }

  @override
  ReplyTweetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ReplyTweetViewModel();
}
