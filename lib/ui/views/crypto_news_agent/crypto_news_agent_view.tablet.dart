import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_agent_viewmodel.dart';

class CryptoNewsAgentViewTablet
    extends ViewModelWidget<CryptoNewsAgentViewModel> {
  const CryptoNewsAgentViewTablet({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsAgentViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI - CryptoNewsAgentView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
