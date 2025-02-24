import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewTablet extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewTablet({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - AgentsView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
