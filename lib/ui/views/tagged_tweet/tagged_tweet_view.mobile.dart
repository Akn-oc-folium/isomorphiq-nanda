import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'tagged_tweet_viewmodel.dart';

class TaggedTweetViewMobile extends ViewModelWidget<TaggedTweetViewModel> {
  const TaggedTweetViewMobile({super.key});

  @override
  Widget build(BuildContext context, TaggedTweetViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI - TaggedTweetView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
