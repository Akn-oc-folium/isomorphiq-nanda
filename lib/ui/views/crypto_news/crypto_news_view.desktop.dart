import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';

import 'crypto_news_viewmodel.dart';

class CryptoNewsViewDesktop extends StatelessWidget {
  const CryptoNewsViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CryptoNewsViewModel>.reactive(
        viewModelBuilder: () => CryptoNewsViewModel(),
        onViewModelReady: (viewModel) => viewModel.init(),
        builder: (context, viewModel, child) {
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: Spacer()),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpace36,
                        Row(
                          children: [
                            IconButton(
                              onPressed: viewModel.navigateBack,
                              icon: Icon(Icons.arrow_back_outlined, size: 30.r),
                              color: kcSecondaryColor,
                            ),
                            horizontalSpace04,
                            Text(
                              "Crypto News Agent",
                              style: TextStyles.titlePrimary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                          ],
                        ),
                        verticalSpace16,
                        verticalSpace16,
                        Wrap(
                          spacing: 8.w,
                          children: [
                            Chip(
                                label: Text('All'),
                                backgroundColor: kcPrimaryColorLight),
                            Chip(
                                label: Text('NFTs'),
                                backgroundColor: kcPrimaryColorLight),
                            Chip(
                                label: Text('Bitcoin'),
                                backgroundColor: kcPrimaryColorLight),
                            Chip(
                                label: Text('Ethereum'),
                                backgroundColor: kcPrimaryColorLight),
                          ],
                        ),
                        verticalSpace16,
                        verticalSpace08,
                        Container(
                          height: 180.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: kcPrimaryColorLight,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: viewModel.currentNews?.imageUrl != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: Image.network(
                                    viewModel.currentNews!.imageUrl!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) =>
                                        Icon(Icons.broken_image, size: 50.r),
                                  ),
                                )
                              : Icon(Icons.image, size: 50.r, color: kcWhite),
                        ),
                        verticalSpace16,
                        verticalSpace08,
                        Text(
                          viewModel.currentNews?.source?.domain ??
                              'Source here',
                          style: TextStyles.titleTertiary
                              .copyWith(color: kcSecondaryColor, fontSize: 20),
                        ),
                        verticalSpace08,
                        Text(
                          viewModel.currentNews?.headline ?? 'Title goes here!',
                          style: TextStyles.titlePrimary.copyWith(
                            color: kcSecondaryColor,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        verticalSpace16,
                        verticalSpace08,
                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(
                              viewModel.currentNews?.summary ??
                                  'Content goes here!',
                              style: TextStyles.bodyPrimary.copyWith(
                                  color: kcSecondaryColor,
                                  fontSize: 18,
                                  height: 1.7),
                            ),
                          ),
                        ),
                        verticalSpace16,
                        verticalSpace08,
                        Row(
                          children: [
                            Expanded(
                              child: SecondaryButton(
                                text: "Previous",
                                onPressed: viewModel.previousNews,
                              ),
                            ),
                            horizontalSpace16,
                            Expanded(
                              child: PrimaryButton(
                                text: "Next",
                                onPressed: viewModel.nextNews,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  horizontalSpace36,
                  horizontalSpace16,
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: 51.r, right: 152.r),
                      child: Container(
                        width: 468,
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.r, vertical: 32.r),
                        decoration: BoxDecoration(
                          color: kcWhite,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: kcPrimaryColor),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Saved",
                              style: TextStyles.titleSecondary.copyWith(
                                color: kcSecondaryColor,
                                fontSize: 24.r,
                              ),
                            ),
                            verticalSpace16,
                            Expanded(
                              child: ListView.separated(
                                itemCount: viewModel.savedNews.length,
                                separatorBuilder: (_, __) => Column(children: [
                                  verticalSpace16,
                                  verticalSpace08
                                ]),
                                itemBuilder: (context, index) {
                                  final saved = viewModel.savedNews[index];
                                  return Container(
                                    padding: EdgeInsets.all(16.r),
                                    decoration: BoxDecoration(
                                      color: kcPrimaryColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          saved.source?.domain ?? 'Source',
                                          style:
                                              TextStyles.titleTertiary.copyWith(
                                            color: kcSecondaryColor,
                                          ),
                                        ),
                                        verticalSpace04,
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    saved.headline ??
                                                        'Headline here',
                                                    style: TextStyles
                                                        .bodyPrimary
                                                        .copyWith(
                                                      color: kcSecondaryColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  verticalSpace04,
                                                  Text(
                                                    saved.summary ?? '',
                                                    style: TextStyles
                                                        .bodyPrimary
                                                        .copyWith(
                                                      color: kcSecondaryColor,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            horizontalSpace08,
                                            Icon(Icons.bookmark,
                                                color: kcPrimaryColor),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
