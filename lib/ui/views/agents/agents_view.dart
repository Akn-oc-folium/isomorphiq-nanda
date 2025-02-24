import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'agents_view.desktop.dart';
import 'agents_view.tablet.dart';
import 'agents_view.mobile.dart';
import 'agents_viewmodel.dart';

class AgentsView extends StackedView<AgentsViewModel> {
  const AgentsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AgentsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AgentsViewMobile(),
      tablet: (_) => const AgentsViewTablet(),
      desktop: (_) => const AgentsViewDesktop(),
    );
  }

  @override
  AgentsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentsViewModel();
}
