import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_agent_viewmodel.dart';

class CryptoNewsAgentViewMobile
    extends ViewModelWidget<CryptoNewsAgentViewModel> {
  const CryptoNewsAgentViewMobile({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsAgentViewModel viewModel) {
    return ViewModelBuilder<CryptoNewsAgentViewModel>.reactive(
        viewModelBuilder: () => CryptoNewsAgentViewModel(),
        onViewModelReady: (viewModel) => viewModel.fetchNews(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: kcWhite,
              centerTitle: true,
              leading: IconButton(
                onPressed: viewModel.navigateBack,
                icon: Icon(Icons.arrow_back, color: Colors.black),
              ),
              title: Text('Crypto News Agent',
                  style: TextStyles.titleSecondary
                      .copyWith(color: kcSecondaryColor)),
            ),
            body: viewModel.isBusy
                ? Center(
                    child: SizedBox(
                      height: 40.r,
                      width: 40.r,
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: kcPrimaryColor.withValues(alpha: 0.5),
                        strokeWidth: 2.0.w,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          kcPrimaryColor,
                        ),
                      ),
                    ),
                  )
                : viewModel.currentNews == null
                    ? Center(child: Text("No news available"))
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.currentNews!.source ??
                                  'Source goes here!',
                              style: TextStyles.titleTertiary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                            verticalSpace08,
                            verticalSpace04,
                            verticalSpace16,
                            Text(
                                viewModel.currentNews!.headline ??
                                    'Title goes here!',
                                style: TextStyles.titleSecondary
                                    .copyWith(color: kcSecondaryColor)),
                            verticalSpace08,
                            Text(
                              viewModel.currentNews!.summary ??
                                  'Content goes here!',
                              style: TextStyles.bodyPrimary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                            Spacer(),
                            SecondaryButton(
                              text: 'Read More',
                              onPressed: viewModel.readMore,
                            ),
                            verticalSpace04,
                            verticalSpace08,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SecondaryButton(
                                      text: "Previous",
                                      onPressed: viewModel.previousNews),
                                ),
                                horizontalSpace16,
                                Expanded(
                                    child: PrimaryButton(
                                        text: "Next",
                                        onPressed: viewModel.nextNews)),
                              ],
                            ),
                          ],
                        ),
                      ),
          );
        });
  }
}
