import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tweet_settings_viewmodel.dart';

class TweetSettingsViewTablet extends ViewModelWidget<TweetSettingsViewModel> {
  const TweetSettingsViewTablet({super.key});

  @override
  Widget build(BuildContext context, TweetSettingsViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - TweetSettingsView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
