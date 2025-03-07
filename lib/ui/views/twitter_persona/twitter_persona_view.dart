import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'twitter_persona_view.desktop.dart';
import 'twitter_persona_view.mobile.dart';
import 'twitter_persona_view.tablet.dart';
import 'twitter_persona_viewmodel.dart';

class TwitterPersonaView extends StackedView<TwitterPersonaViewModel> {
  const TwitterPersonaView({super.key});

  @override
  Widget builder(
    BuildContext context,
    TwitterPersonaViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const TwitterPersonaViewMobile(),
      tablet: (_) => const TwitterPersonaViewTablet(),
      desktop: (_) => const TwitterPersonaViewDesktop(),
    );
  }

  @override
  TwitterPersonaViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TwitterPersonaViewModel();
}
