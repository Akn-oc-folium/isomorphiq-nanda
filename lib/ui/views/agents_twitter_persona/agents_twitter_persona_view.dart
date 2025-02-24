import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'agents_twitter_persona_view.desktop.dart';
import 'agents_twitter_persona_view.tablet.dart';
import 'agents_twitter_persona_view.mobile.dart';
import 'agents_twitter_persona_viewmodel.dart';

class AgentsTwitterPersonaView
    extends StackedView<AgentsTwitterPersonaViewModel> {
  const AgentsTwitterPersonaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AgentsTwitterPersonaViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AgentsTwitterPersonaViewMobile(),
      tablet: (_) => const AgentsTwitterPersonaViewTablet(),
      desktop: (_) => const AgentsTwitterPersonaViewDesktop(),
    );
  }

  @override
  AgentsTwitterPersonaViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AgentsTwitterPersonaViewModel();
}
