import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_agent_viewmodel.dart';

class CryptoNewsAgentViewMobile
    extends ViewModelWidget<CryptoNewsAgentViewModel> {
  const CryptoNewsAgentViewMobile({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsAgentViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcWhite,
        centerTitle: true,
        leading: IconButton(
          onPressed: viewModel.navigateBack,
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Crypto News Agent',
            style: TextStyles.titleSecondary.copyWith(color: kcSecondaryColor)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CBS News",
              style: TextStyles.titleTertiary.copyWith(color: kcSecondaryColor),
            ),
            SizedBox(height: 10),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kcPrimaryColorAccent,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 16),
            Text("Pi Network mainnet launch sees Pi coin rally over 35%",
                style:
                    TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor)),
            SizedBox(height: 8),
            Text(
              "Pi coin surged over 35% less than an hour after its highly anticipated mainnet went live.\n\n"
              "Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. "
              "The launch was a significant milestone for the project, which has been in development for over six years and has operated in an enclosed mainnet since 2021.",
              style: TextStyles.bodySecondary.copyWith(color: kcSecondaryColor),
            ),
            Spacer(),
            SecondaryButton(text: 'Read More', onPressed: viewModel.readMore),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SecondaryButton(
                      text: "Previous", onPressed: viewModel.previousNews),
                ),
                SizedBox(width: 10),
                Expanded(
                    child: PrimaryButton(
                        text: "Next", onPressed: viewModel.nextNews)),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
