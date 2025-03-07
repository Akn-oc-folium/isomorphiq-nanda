import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_viewmodel.dart';

class CryptoNewsViewDesktop extends ViewModelWidget<CryptoNewsViewModel> {
  const CryptoNewsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsViewModel viewModel) {
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
