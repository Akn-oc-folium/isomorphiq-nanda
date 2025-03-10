import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'ai_persona_viewmodel.dart';

class AiPersonaViewTablet extends ViewModelWidget<AiPersonaViewModel> {
  const AiPersonaViewTablet({super.key});

  @override
  Widget build(BuildContext context, AiPersonaViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - AiPersonaView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
