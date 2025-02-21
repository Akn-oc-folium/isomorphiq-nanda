import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'jackpot_viewmodel.dart';

class JackpotViewTablet extends ViewModelWidget<JackpotViewModel> {
  const JackpotViewTablet({super.key});

  @override
  Widget build(BuildContext context, JackpotViewModel viewModel) {
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
