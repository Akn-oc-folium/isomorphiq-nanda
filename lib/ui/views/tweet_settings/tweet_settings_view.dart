import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'tweet_settings_view.desktop.dart';
import 'tweet_settings_view.tablet.dart';
import 'tweet_settings_view.mobile.dart';
import 'tweet_settings_viewmodel.dart';

class TweetSettingsView extends StackedView<TweetSettingsViewModel> {
  const TweetSettingsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TweetSettingsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TweetSettingsViewMobile(),
      tablet: (_) => const TweetSettingsViewTablet(),
      desktop: (_) => const TweetSettingsViewDesktop(),
    );
  }

  @override
  TweetSettingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TweetSettingsViewModel();
}
