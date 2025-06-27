import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_viewmodel.dart';

class CryptoNewsViewMobile extends ViewModelWidget<CryptoNewsViewModel> {
  const CryptoNewsViewMobile({super.key});

  @override
  Widget build(BuildContext context, CryptoNewsViewModel viewModel) {
    return ViewModelBuilder<CryptoNewsViewModel>.reactive(
        viewModelBuilder: () => CryptoNewsViewModel(),
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
                        padding: const EdgeInsets.all(16.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewModel.currentNews!.source!.domain ??
                                          'Source goes here!',
                                      style: TextStyles.titleTertiary
                                          .copyWith(color: kcSecondaryColor),
                                    ),
                                    verticalSpace08,
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(12).r,
                                      child: viewModel.currentNews!.imageUrl !=
                                              null
                                          ? Image.network(
                                              viewModel.currentNews!.imageUrl!,
                                              height: 150.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                debugPrint(
                                                    "Image loading error: $error");
                                                return Container(
                                                  height: 150.h,
                                                  width: double.infinity,
                                                  color: kcPrimaryColorAccent,
                                                  child: Icon(
                                                    Icons.image,
                                                    size: 50.r,
                                                    color: kcWhite,
                                                  ),
                                                );
                                              },
                                            )
                                          : Container(
                                              height: 150.h,
                                              width: double.infinity,
                                              color: kcPrimaryColorAccent,
                                              child: Icon(
                                                Icons.image,
                                                size: 50.r,
                                                color: kcWhite,
                                              ),
                                            ),
                                    ),
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
                                  ],
                                ),
                              ),
                            ),

                            // Actions section starts here
                            Column(
                              children: [
                                SecondaryButton(
                                  text: 'Read More',
                                  onPressed: viewModel.readMore,
                                ),
                                verticalSpace04,
                                verticalSpace08,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                          ],
                        ),
                      ),
          );
        });
  }
}
