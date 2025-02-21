import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'jackpot_viewmodel.dart';

class JackpotViewDesktop extends ViewModelWidget<JackpotViewModel> {
  const JackpotViewDesktop({super.key});

  @override
  Widget build(BuildContext context, JackpotViewModel viewModel) {
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
