import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'twitter_persona_viewmodel.dart';

class TwitterPersonaViewTablet
    extends ViewModelWidget<TwitterPersonaViewModel> {
  const TwitterPersonaViewTablet({super.key});

  @override
  Widget build(BuildContext context, TwitterPersonaViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - AgentsTwitterPersonaView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
