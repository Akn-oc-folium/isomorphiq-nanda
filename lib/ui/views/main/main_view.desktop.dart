import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainViewDesktop extends ViewModelWidget<MainViewModel> {
  const MainViewDesktop({super.key});

  @override
  Widget build(BuildContext context, MainViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              verticalSpace48,
              Column(
                children: [
                  const Text(
                    'Hello, DESKTOP UI!',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  verticalSpace16,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
