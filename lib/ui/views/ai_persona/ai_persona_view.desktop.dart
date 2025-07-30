import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/main_layout/main_layout_view.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:isomorph_iq_nanda/ui/widgets/persona_slider.dart';
import 'package:stacked/stacked.dart';

import 'ai_persona_viewmodel.dart';

class AiPersonaViewDesktop extends ViewModelWidget<AiPersonaViewModel> {
  const AiPersonaViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AiPersonaViewModel viewModel) {
    return MainLayoutView(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 36.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: viewModel.navigateBack,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                  horizontalSpace08,
                  Text('Agent Settings',
                      style: TextStyles.titlePrimary
                          .copyWith(color: kcSecondaryColor)),
                ],
              ),
              verticalSpace08,
              Text(
                'Customize how you want your Twitter Persona to sound',
                style: TextStyles.bodyPrimary
                    .copyWith(color: kcSecondaryColor, fontSize: 18.sp),
              ),
              verticalSpace16,
              verticalSpace08,
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 80.w,
                    mainAxisSpacing: 24.h,
                    childAspectRatio: constraints.maxWidth / 2 / 100.h,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: viewModel.sliderList.map((slider) {
                      return PersonaSlider(
                        title: slider["title"] ?? "",
                        leftLabel: slider["leftLabel"] ?? "",
                        rightLabel: slider["rightLabel"] ?? "",
                        value: viewModel.sliderValues[slider["title"]] ?? 0.5,
                        onChanged: (value) => viewModel.updateSlider(
                            slider["title"] ?? "", value),
                        divisions: 4,
                      );
                    }).toList(),
                  );
                },
              ),

              verticalSpace36,

              /// Topics & Interests
              Text('Topics and Interests',
                  style: TextStyles.titlePrimary
                      .copyWith(color: kcSecondaryColor)),
              verticalSpace16,
              verticalSpace04,
              Text('Your Topics',
                  style: TextStyles.titleSecondary
                      .copyWith(fontWeight: FontWeight.bold)),
              verticalSpace08,

              Wrap(
                spacing: 8.w,
                runSpacing: 8.h,
                children: viewModel.selectedTopics.map((tag) {
                  return Chip(
                    label: Text(tag),
                    backgroundColor: kcStrokePrimary,
                    deleteIcon: const Icon(Icons.close, size: 18),
                    onDeleted: () => viewModel.removeTopic(tag),
                  );
                }).toList(),
              ),

              verticalSpace16,
              verticalSpace08,

              ...viewModel.currentTopics.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(entry.key,
                        style: TextStyles.titleSecondary
                            .copyWith(fontWeight: FontWeight.bold)),
                    verticalSpace08,
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 8.h,
                      children: entry.value.map((e) {
                        return Chip(
                          label: Text(e),
                          backgroundColor: kcPrimaryColorLight,
                        );
                      }).toList(),
                    ),
                    verticalSpace16,
                  ],
                );
              }),

              verticalSpace16,

              TextField(
                controller: viewModel.interestController,
                decoration: InputDecoration(
                  hintText: "Input your own interest...",
                  suffixIcon: GestureDetector(
                    onTap: viewModel.addInterest,
                    child:
                        Icon(Icons.add_circle_outline, color: kcPrimaryColor),
                  ),
                  filled: true,
                  fillColor: kcWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: kcPrimaryColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide:
                        BorderSide(color: kcPrimaryColor.withOpacity(0.4)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: kcPrimaryColor, width: 1.5),
                  ),
                ),
              ),

              verticalSpace36,

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300.w,
                  child: PrimaryButton(
                    text: 'Confirm Changes',
                    onPressed: viewModel.confirmChanges,
                    isBusy: viewModel.busy('personaUpdating'),
                  ),
                ),
              ),
              verticalSpace16,
              verticalSpace08,
            ],
          ),
        ),
      ),
    );
  }
}
