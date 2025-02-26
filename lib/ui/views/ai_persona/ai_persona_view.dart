import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'ai_persona_view.desktop.dart';
import 'ai_persona_view.tablet.dart';
import 'ai_persona_view.mobile.dart';
import 'ai_persona_viewmodel.dart';

class AiPersonaView extends StackedView<AiPersonaViewModel> {
  const AiPersonaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AiPersonaViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AiPersonaViewMobile(),
      tablet: (_) => const AiPersonaViewTablet(),
      desktop: (_) => const AiPersonaViewDesktop(),
    );
  }

  @override
  AiPersonaViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AiPersonaViewModel();
}
