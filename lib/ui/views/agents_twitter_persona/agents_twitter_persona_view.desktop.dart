import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'agents_twitter_persona_viewmodel.dart';

class AgentsTwitterPersonaViewDesktop
    extends ViewModelWidget<AgentsTwitterPersonaViewModel> {
  const AgentsTwitterPersonaViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AgentsTwitterPersonaViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI - AgentsTwitterPersonaView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
