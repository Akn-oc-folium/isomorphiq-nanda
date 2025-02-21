import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_view.desktop.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_view.mobile.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_view.tablet.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_viewmodel.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class GoogleAuthView extends StackedView<GoogleAuthViewModel> {
  const GoogleAuthView({super.key});

  @override
  Widget builder(
    BuildContext context,
    GoogleAuthViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const GoogleAuthViewMobile(),
      tablet: (_) => const GoogleAuthViewTablet(),
      desktop: (_) => const GoogleAuthViewDesktop(),
    );
  }

  @override
  GoogleAuthViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      GoogleAuthViewModel();
}
