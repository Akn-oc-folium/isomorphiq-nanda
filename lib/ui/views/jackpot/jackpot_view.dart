import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'jackpot_view.desktop.dart';
import 'jackpot_view.tablet.dart';
import 'jackpot_view.mobile.dart';
import 'jackpot_viewmodel.dart';

class JackpotView extends StackedView<JackpotViewModel> {
  const JackpotView({super.key});

  @override
  Widget builder(
    BuildContext context,
    JackpotViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const JackpotViewMobile(),
      tablet: (_) => const JackpotViewTablet(),
      desktop: (_) => const JackpotViewDesktop(),
    );
  }

  @override
  JackpotViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      JackpotViewModel();
}
