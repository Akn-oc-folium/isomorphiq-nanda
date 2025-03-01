import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:isomorph_iq/ui/widgets/custom_app_bar.dart';
import 'package:isomorph_iq/ui/widgets/persona_slider.dart';
import 'package:stacked/stacked.dart';

import 'tweet_settings_viewmodel.dart';

class TweetSettingsViewMobile extends ViewModelWidget<TweetSettingsViewModel> {
  const TweetSettingsViewMobile({super.key});

  @override
  Widget build(BuildContext context, TweetSettingsViewModel viewModel) {
    return ViewModelBuilder<TweetSettingsViewModel>.reactive(
      viewModelBuilder: () => TweetSettingsViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            context: context,
            title: Text(
              "Tweet Settings",
              style: TextStyles.titlePrimary
                  .copyWith(color: kcSecondaryColor, fontSize: 20.0),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customize your tweet frequency & more",
                    style:
                        TextStyles.bodyPrimary.copyWith(color: kcPrimaryColor),
                  ),
                  verticalSpace08,
                  verticalSpace16,
                  ...viewModel.sliderList.map((slider) {
                    return PersonaSlider(
                      title: slider["title"],
                      leftLabel: slider["leftLabel"],
                      rightLabel: slider["rightLabel"],
                      value: viewModel.sliderValues[slider["title"]] ?? 0.5,
                      onChanged: (value) =>
                          viewModel.updateSlider(slider["title"], value),
                    );
                  }),
                  Row(
                    children: [
                      Checkbox(
                        value: viewModel.randomize,
                        shape: const CircleBorder(),
                        activeColor: kcPrimaryColor,
                        onChanged: (value) =>
                            viewModel.toggleRandomize(value ?? false),
                      ),
                      Text("Randomize",
                          style: TextStyles.titleSecondary
                              .copyWith(color: kcSecondaryColor)),
                    ],
                  ),
                  Text("Slightly shifts tweet times to appear natural",
                      style: TextStyles.bodyPrimary
                          .copyWith(color: kcSecondaryColor)),
                  const Spacer(),
                  PrimaryButton(
                      text: 'Confirm Changes',
                      onPressed: viewModel.confirmChanges),
                  verticalSpace16
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
