import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

import 'choose_plan_viewmodel.dart';

class ChoosePlanViewMobile extends ViewModelWidget<ChoosePlanViewModel> {
  const ChoosePlanViewMobile({super.key});

  @override
  Widget build(BuildContext context, ChoosePlanViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcWhite,
        centerTitle: true,
        leading: IconButton(
          onPressed: viewModel.navigateBack,
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Choose a plan',
            style: TextStyles.titleSecondary.copyWith(color: kcSecondaryColor)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child:
                          SecondaryButton(text: 'Monthly', onPressed: () {})),
                  horizontalSpace08,
                  Expanded(
                      child: PrimaryButton.small(
                          text: 'Yearly -20% off', onPressed: () {}))
                ],
              ),
              verticalSpace16,
              Expanded(
                child: ListView(
                  children: [
                    _buildPlanCard(
                      title: "Free",
                      price: "\$0/ month",
                      credits: "Includes 30 Credits monthly",
                      description: [
                        "Generate 1 tweet or reply daily",
                        "AI-curated news feed based on interests",
                        "Token Airdrop Eligibility"
                      ],
                      buttonText: "Current",
                      isCurrentPlan: true,
                      onPressed: () {},
                    ),
                    _buildPlanCard(
                      title: "Pro",
                      price: "\$10/ month",
                      credits: "Includes 200 Credits monthly",
                      description: [
                        "Everything included in Free",
                        "Generate 100 tweets/replies in a month",
                        "Greater Token Airdrop Eligibility"
                      ],
                      buttonText: "Upgrade to Pro",
                      isCurrentPlan: false,
                      onPressed: () => viewModel.upgradePlan("Pro"),
                    ),
                    _buildPlanCard(
                      title: "Community",
                      price: "\$30/ month",
                      credits: "Includes 600 Credits monthly",
                      description: [
                        "Everything included in Pro",
                        "Generate 300 tweets/replies in a month",
                        "Highest allocation at Token Airdrop"
                      ],
                      buttonText: "Upgrade to Unlimited",
                      isCurrentPlan: false,
                      onPressed: () => viewModel.upgradePlan("Community"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required String credits,
    required List<String> description,
    required String buttonText,
    required bool isCurrentPlan,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: TextStyles.titleSecondary.copyWith(
                    color: kcSecondaryColor,
                    fontWeight: FontWeight.bold,
                  )),
              Text(price,
                  style: TextStyles.titleSecondary.copyWith(
                      color: kcSecondaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24)),
            ],
          ),
          verticalSpace04,
          verticalSpace08,
          Text(credits,
              style: TextStyles.titleSecondary.copyWith(
                  color: kcPrimaryColor, fontWeight: FontWeight.bold)),
          verticalSpace08,
          isCurrentPlan
              ? SecondaryButton(text: buttonText)
              : PrimaryButton(text: buttonText, onPressed: onPressed),
          verticalSpace08,
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ...description
                .map((text) => Text(text, style: TextStyles.bodyPrimary)),
            verticalSpace04
          ]),
        ],
      ),
    );
  }
}
