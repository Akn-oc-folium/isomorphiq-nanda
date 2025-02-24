import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewDesktop extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI - AgentsView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
