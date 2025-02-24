import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_agent_viewmodel.dart';

class CryptoNewsAgentViewDesktop
    extends ViewModelWidget<CryptoNewsAgentViewModel> {
  const CryptoNewsAgentViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsAgentViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, DESKTOP UI - CryptoNewsAgentView!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
