import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'agent_home_viewmodel.dart';

class AgentHomeViewTablet extends ViewModelWidget<AgentHomeViewModel> {
  const AgentHomeViewTablet({super.key});

  @override
  Widget build(BuildContext context, AgentHomeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - AgentHomeView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
