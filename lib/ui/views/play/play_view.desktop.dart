import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'play_viewmodel.dart';

class PlayViewDesktop extends ViewModelWidget<PlayViewModel> {
  const PlayViewDesktop({super.key});

  @override
  Widget build(BuildContext context, PlayViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
