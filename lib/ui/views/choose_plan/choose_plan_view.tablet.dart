import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'choose_plan_viewmodel.dart';

class ChoosePlanViewTablet extends ViewModelWidget<ChoosePlanViewModel> {
  const ChoosePlanViewTablet({super.key});

  @override
  Widget build(BuildContext context, ChoosePlanViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - ChoosePlanView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
