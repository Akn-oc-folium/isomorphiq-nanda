import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_viewmodel.dart';

class CryptoNewsViewTablet extends ViewModelWidget<CryptoNewsViewModel> {
  const CryptoNewsViewTablet({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsViewModel viewModel) {
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
