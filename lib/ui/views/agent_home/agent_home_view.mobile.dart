import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/custom_app_bar.dart';
import 'package:isomorph_iq_nanda/ui/widgets/twitter_tools_card_mobile.dart';
import 'package:stacked/stacked.dart';

import 'agent_home_viewmodel.dart';

class AgentHomeViewMobile extends ViewModelWidget<AgentHomeViewModel> {
  const AgentHomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, AgentHomeViewModel viewModel) {
    return Scaffold(
      appBar: CustomAppBar(context: context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 19.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace08,
              verticalSpace04,
              Text('Twitter Tools',
                  style: TextStyles.titlePrimary
                      .copyWith(color: kcSecondaryColor)),
              verticalSpace08,
              Text(
                'Use IQ to tweet and reply custom tweets on X',
                style:
                    TextStyles.bodySecondary.copyWith(color: kcSecondaryColor),
              ),
              verticalSpace16,
              verticalSpace04,
              TwitterToolsMobileCard(
                number: 16,
                title: 'Generated tweets to review',
                onPressed: viewModel.onTwitterPersonaPressed,
              ),
              verticalSpace16,
              verticalSpace04,
              TwitterToolsMobileCard(
                number: 5,
                title: 'Tagged tweets to be discussed',
                onPressed: viewModel.onTaggedTwitterPressed,
              ),
              verticalSpace16,
              verticalSpace04,
              TwitterToolsMobileCard(
                number: 8,
                title: 'Tweets to generate replies to',
                onPressed: viewModel.onReplyTwitterPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
