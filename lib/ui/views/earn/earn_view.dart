import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'earn_view.desktop.dart';
import 'earn_view.tablet.dart';
import 'earn_view.mobile.dart';
import 'earn_viewmodel.dart';

class EarnView extends StackedView<EarnViewModel> {
  const EarnView({super.key});

  @override
  Widget builder(
    BuildContext context,
    EarnViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const EarnViewMobile(),
      tablet: (_) => const EarnViewTablet(),
      desktop: (_) => const EarnViewDesktop(),
    );
  }

  @override
  EarnViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EarnViewModel();
}
