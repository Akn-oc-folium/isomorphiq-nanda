import 'package:flutter/material.dart';
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
                ? Center(child: CircularProgressIndicator())
                : viewModel.currentNews == null
                    ? Center(child: Text("No news available"))
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              viewModel.currentNews!.data!.source ??
                                  'Source goes here!',
                              style: TextStyles.titleTertiary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                            verticalSpace08,
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child:
                                  // viewModel.currentNews!.imageUrl != null
                                  //     ? Image.network(
                                  //         viewModel.currentNews!.imageUrl!,
                                  //         height: 150,
                                  //         width: double.infinity,
                                  //         fit: BoxFit.cover,
                                  //         loadingBuilder:
                                  //             (context, child, loadingProgress) {
                                  //           if (loadingProgress == null) {
                                  //             return child;
                                  //           }
                                  //           return Center(
                                  //               child: CircularProgressIndicator());
                                  //         },
                                  //         errorBuilder:
                                  //             (context, error, stackTrace) {
                                  //           return Container(
                                  //             height: 150,
                                  //             width: double.infinity,
                                  //             color: kcPrimaryColorAccent,
                                  //             child: Icon(Icons.image,
                                  //                 size: 50, color: kcWhite),
                                  //           );
                                  //         },
                                  //       )
                                  // :
                                  Container(
                                height: 150,
                                width: double.infinity,
                                color: kcPrimaryColorAccent,
                                child:
                                    Icon(Icons.image, size: 50, color: kcWhite),
                              ),
                            ),
                            verticalSpace04,
                            verticalSpace16,
                            Text(
                                viewModel.currentNews!.data!.headline ??
                                    'Title goes here!',
                                style: TextStyles.titleSecondary
                                    .copyWith(color: kcSecondaryColor)),
                            verticalSpace08,
                            Text(
                              viewModel.currentNews!.data!.summary ??
                                  'Content goes here!',
                              style: TextStyles.bodyPrimary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                            Spacer(),
                            SecondaryButton(
                                text: 'Read More',
                                onPressed: () {} // viewModel.readMore,
                                ),
                            verticalSpace04,
                            verticalSpace08,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SecondaryButton(
                                      text: "Previous",
                                      onPressed:
                                          () {} // viewModel.previousNews,
                                      ),
                                ),
                                horizontalSpace16,
                                Expanded(
                                  child: PrimaryButton(
                                    text: "Next",
                                    onPressed: () {} // viewModel.nextNews
                                    ,
                                  ),
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
