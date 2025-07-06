import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'reply_tweet_viewmodel.dart';

class ReplyTweetViewTablet extends ViewModelWidget<ReplyTweetViewModel> {
  const ReplyTweetViewTablet({super.key});

  @override
  Widget build(BuildContext context, ReplyTweetViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - ReplyTweetView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
