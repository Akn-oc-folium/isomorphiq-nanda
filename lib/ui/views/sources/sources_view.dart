import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'sources_view.desktop.dart';
import 'sources_view.tablet.dart';
import 'sources_view.mobile.dart';
import 'sources_viewmodel.dart';

class SourcesView extends StackedView<SourcesViewModel> {
  const SourcesView({super.key});

  @override
  Widget builder(
    BuildContext context,
    SourcesViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const SourcesViewMobile(),
      tablet: (_) => const SourcesViewTablet(),
      desktop: (_) => const SourcesViewDesktop(),
    );
  }

  @override
  SourcesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SourcesViewModel();
}
