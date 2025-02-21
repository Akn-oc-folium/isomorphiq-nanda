import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/views/google_auth/google_auth_viewmodel.dart';
import 'package:stacked/stacked.dart';

class GoogleAuthViewTablet extends ViewModelWidget<GoogleAuthViewModel> {
  const GoogleAuthViewTablet({super.key});

  @override
  Widget build(BuildContext context, GoogleAuthViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
