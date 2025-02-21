import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'play_viewmodel.dart';

class PlayViewTablet extends ViewModelWidget<PlayViewModel> {
  const PlayViewTablet({super.key});

  @override
  Widget build(BuildContext context, PlayViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
