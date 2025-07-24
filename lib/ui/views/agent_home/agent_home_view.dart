import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'agent_home_view.desktop.dart';
import 'agent_home_view.tablet.dart';
import 'agent_home_view.mobile.dart';
import 'agent_home_viewmodel.dart';

class AgentHomeView extends StackedView<AgentHomeViewModel> {
  const AgentHomeView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AgentHomeViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AgentHomeViewMobile(),
      tablet: (_) => const AgentHomeViewTablet(),
      desktop: (_) => const AgentHomeViewDesktop(),
    );
  }

  @override
  AgentHomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentHomeViewModel();
}
