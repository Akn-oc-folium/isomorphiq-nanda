import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'earn_viewmodel.dart';

class EarnViewTablet extends ViewModelWidget<EarnViewModel> {
  const EarnViewTablet({super.key});

  @override
  Widget build(BuildContext context, EarnViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
