import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'tagged_tweet_view.desktop.dart';
import 'tagged_tweet_view.tablet.dart';
import 'tagged_tweet_view.mobile.dart';
import 'tagged_tweet_viewmodel.dart';

class TaggedTweetView extends StackedView<TaggedTweetViewModel> {
  const TaggedTweetView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TaggedTweetViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TaggedTweetViewMobile(),
      tablet: (_) => const TaggedTweetViewTablet(),
      desktop: (_) => const TaggedTweetViewDesktop(),
    );
  }

  @override
  TaggedTweetViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TaggedTweetViewModel();
}
