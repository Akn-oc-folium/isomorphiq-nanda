import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'choose_plan_view.desktop.dart';
import 'choose_plan_view.tablet.dart';
import 'choose_plan_view.mobile.dart';
import 'choose_plan_viewmodel.dart';

class ChoosePlanView extends StackedView<ChoosePlanViewModel> {
  const ChoosePlanView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ChoosePlanViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ChoosePlanViewMobile(),
      tablet: (_) => const ChoosePlanViewTablet(),
      desktop: (_) => const ChoosePlanViewDesktop(),
    );
  }

  @override
  ChoosePlanViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChoosePlanViewModel();
}
