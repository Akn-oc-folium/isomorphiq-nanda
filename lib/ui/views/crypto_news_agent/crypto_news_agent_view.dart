import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_agent_view.desktop.dart';
import 'crypto_news_agent_view.tablet.dart';
import 'crypto_news_agent_view.mobile.dart';
import 'crypto_news_agent_viewmodel.dart';

class CryptoNewsAgentView extends StackedView<CryptoNewsAgentViewModel> {
  const CryptoNewsAgentView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CryptoNewsAgentViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CryptoNewsAgentViewMobile(),
      tablet: (_) => const CryptoNewsAgentViewTablet(),
      desktop: (_) => const CryptoNewsAgentViewDesktop(),
    );
  }

  @override
  CryptoNewsAgentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CryptoNewsAgentViewModel();
}
