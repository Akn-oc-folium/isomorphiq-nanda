import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tagged_tweet_viewmodel.dart';

class TaggedTweetViewTablet extends ViewModelWidget<TaggedTweetViewModel> {
  const TaggedTweetViewTablet({super.key});

  @override
  Widget build(BuildContext context, TaggedTweetViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - TaggedTweetView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
