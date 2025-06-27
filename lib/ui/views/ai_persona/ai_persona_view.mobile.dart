import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:isomorph_iq_nanda/ui/widgets/custom_app_bar.dart';
import 'package:isomorph_iq_nanda/ui/widgets/persona_slider.dart';
import 'package:stacked/stacked.dart';

import 'ai_persona_viewmodel.dart';

class AiPersonaViewMobile extends ViewModelWidget<AiPersonaViewModel> {
  const AiPersonaViewMobile({super.key});

  @override
  Widget build(BuildContext context, AiPersonaViewModel viewModel) {
    return ViewModelBuilder<AiPersonaViewModel>.reactive(
      viewModelBuilder: () => AiPersonaViewModel(),
      onViewModelReady: (viewModel) => viewModel.fetchSliderValues(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            context: context,
            title: const Text("AI Persona"),
          ),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Customize how you want your Twitter Persona to sound",
                    style: TextStyles.titleSecondary
                        .copyWith(color: kcPrimaryColor),
                  ),
                  verticalSpace08,
                  verticalSpace16,
                  ...viewModel.sliderList.map((slider) {
                    return PersonaSlider(
                      title: slider["title"] ?? "",
                      leftLabel: slider["leftLabel"] ?? "",
                      rightLabel: slider["rightLabel"] ?? "",
                      value: viewModel.sliderValues[slider["title"]] ?? 0.5,
                      onChanged: (value) =>
                          viewModel.updateSlider(slider["title"] ?? "", value),
                      divisions: 4,
                    );
                  }),
                  // Text(
                  //   'Accounts you follow',
                  //   style: TextStyles.titleSecondary
                  //       .copyWith(color: kcSecondaryColor),
                  // ),
                  // TextField(
                  //   controller: viewModel.accountsController,
                  //   decoration: InputDecoration(
                  //     hintText: "Enter account names",
                  //     hintStyle: TextStyles.bodyPrimary
                  //         .copyWith(color: kcPrimaryColor),
                  //     filled: true,
                  //     fillColor: kcPrimaryColorLight,
                  //     border: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(16),
                  //         borderSide: BorderSide(color: kcPrimaryColorLight)),
                  //     enabledBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(16),
                  //         borderSide: BorderSide(color: kcPrimaryColorLight)),
                  //   ),
                  // ),
                  // verticalSpace16,
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text("Topics and Interests",
                  //         style: TextStyles.titleSecondary
                  //             .copyWith(color: kcSecondaryColor)),
                  //     GestureDetector(
                  //       onTap: () => viewModel.changeTopics(),
                  //       child: Text("Change",
                  //           style: TextStyles.titleTertiary
                  //               .copyWith(color: kcPrimaryColor)),
                  //     ),
                  //   ],
                  // ),
                  // verticalSpace08,
                  // TagList(tags: viewModel.selectedTopics),
                  // verticalSpace16,
                  const Spacer(),
                  PrimaryButton(
                    text: 'Confirm Changes',
                    onPressed: viewModel.confirmChanges,
                    isBusy: viewModel.busy('personaUpdating'),
                  ),
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
