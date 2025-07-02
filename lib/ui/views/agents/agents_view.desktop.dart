import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/twitter_tools_card.dart';
import 'package:stacked/stacked.dart';

import 'agents_viewmodel.dart';

class AgentsViewDesktop extends ViewModelWidget<AgentsViewModel> {
  const AgentsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, AgentsViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 53,
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32.r),
            topRight: Radius.circular(32.r),
          ),
          child: Container(
            height: 249.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  kcPrimaryColorLight,
                  kcPrimaryColorLight.withValues(alpha: 0),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: 30.h,
                    right: 30.w,
                    child: Opacity(
                      opacity: 0.3,
                      child: SvgPicture.asset(
                        Assets.icons.xLogoVector,
                        width: 145.w,
                        height: 145.h,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 53.0, left: 30).r,
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: viewModel.navigateBack,
                                icon:
                                    Icon(Icons.arrow_back, color: Colors.black),
                              ),
                              horizontalSpace08,
                              Text(
                                'Twitter Tools',
                                style: TextStyles.titlePrimary
                                    .copyWith(color: kcSecondaryColor),
                              ),
                            ],
                          ),
                          Text(
                            'Use IQ to tweet and reply custom tweets on X',
                            style: TextStyles.titleTertiary
                                .copyWith(color: kcSecondaryColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        verticalSpace36,
        Row(
          children: [
            Expanded(
              child: TwitterToolsCard(
                number: 16,
                title: 'Generated tweets to review',
                onPressed: viewModel.onTwitterPersonaPressed,
              ),
            ),
            horizontalSpace36,
            Expanded(
              child: TwitterToolsCard(
                number: 5,
                title: 'Tagged tweets to be discussed',
                onPressed: viewModel.onTaggedTwitterPressed,
              ),
            ),
            horizontalSpace36,
            Expanded(
                child: TwitterToolsCard(
                    number: 8, title: 'Tweets to generate replies to')),
          ],
        ),
      ],
    );
  }
}
