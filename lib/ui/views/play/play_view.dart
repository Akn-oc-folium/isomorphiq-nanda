import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'play_view.desktop.dart';
import 'play_view.tablet.dart';
import 'play_view.mobile.dart';
import 'play_viewmodel.dart';

class PlayView extends StackedView<PlayViewModel> {
  const PlayView({super.key});

  @override
  Widget builder(
    BuildContext context,
    PlayViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const PlayViewMobile(),
      tablet: (_) => const PlayViewTablet(),
      desktop: (_) => const PlayViewDesktop(),
    );
  }

  @override
  PlayViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PlayViewModel();
}
