import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_view.desktop.dart';
import 'crypto_news_view.mobile.dart';
import 'crypto_news_view.tablet.dart';
import 'crypto_news_viewmodel.dart';

class CryptoNewsAgentView extends StackedView<CryptoNewsViewModel> {
  const CryptoNewsAgentView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CryptoNewsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const CryptoNewsViewMobile(),
      tablet: (_) => const CryptoNewsViewTablet(),
      desktop: (_) => const CryptoNewsViewDesktop(),
    );
  }

  @override
  CryptoNewsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CryptoNewsViewModel();
}
