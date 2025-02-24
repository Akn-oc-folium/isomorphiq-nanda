import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'agents_twitter_persona_viewmodel.dart';

class AgentsTwitterPersonaViewTablet
    extends ViewModelWidget<AgentsTwitterPersonaViewModel> {
  const AgentsTwitterPersonaViewTablet({super.key});

  @override
  Widget build(BuildContext context, AgentsTwitterPersonaViewModel viewModel) {
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
