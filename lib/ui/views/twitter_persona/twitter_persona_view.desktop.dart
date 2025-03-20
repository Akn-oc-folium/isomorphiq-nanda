import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'twitter_persona_viewmodel.dart';

class TwitterPersonaViewDesktop
    extends ViewModelWidget<TwitterPersonaViewModel> {
  const TwitterPersonaViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TwitterPersonaViewModel viewModel) {
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
