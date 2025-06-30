import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutViewTablet extends ViewModelWidget<MainLayoutViewModel> {
  const MainLayoutViewTablet({super.key});

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - MainLayoutView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
