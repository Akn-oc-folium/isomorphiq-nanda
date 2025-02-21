import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sources_viewmodel.dart';

class SourcesViewDesktop extends ViewModelWidget<SourcesViewModel> {
  const SourcesViewDesktop({super.key});

  @override
  Widget build(BuildContext context, SourcesViewModel viewModel) {
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
