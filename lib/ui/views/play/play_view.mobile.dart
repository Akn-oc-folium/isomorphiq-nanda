import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:isomorph_iq/ui/widgets/chest_box.dart';
import 'package:stacked/stacked.dart';

import 'play_viewmodel.dart';

class PlayViewMobile extends StackedView<PlayViewModel> {
  const PlayViewMobile({super.key});

  @override
  Widget builder(BuildContext context, PlayViewModel viewModel, child) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0).r,
        child: Column(
          children: [
            Text(
              'Round ${viewModel.round}',
              style: TextStyles.titlePrimary.copyWith(color: kcSecondaryColor),
            ),
            verticalSpace08,
            Text(
              'Choose Your Card!',
              style:
                  TextStyles.titleSecondary.copyWith(color: kcSecondaryColor),
            ),
            verticalSpace16,
            verticalSpace04,
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 4.0.w,
              runSpacing: 4.0.h,
              children: List.generate(
                viewModel.revealedCards.length,
                (index) {
                  final isRevealed = viewModel.revealedCards[index];
                  return GestureDetector(
                    onTap: () => viewModel.revealCard(index),
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      borderOnForeground: false,
                      child: Container(
                        width: 88.w,
                        height: 112.h,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [kcPrimaryColor, kcStrokeSecondary],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: kcStrokePrimary,
                              offset: Offset(0, 1),
                            ),
                          ],
                          border: Border.all(color: kcStrokePrimary),
                        ),
                        child: Center(
                          child: isRevealed
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    (viewModel.chestPool[index] == "Common")
                                        ? Assets.images.chestLevel1Closed
                                            .image(height: 78.h)
                                        : viewModel.chestPool[index] == "Rare"
                                            ? Assets.images.chestLevel2Closed
                                                .image(height: 78.h)
                                            : Assets.images.chestLevel3Closed
                                                .image(
                                                height: 78.h,
                                              ),
                                    verticalSpace(2),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Assets.icons.coin.image(width: 13.w),
                                        horizontalSpace04,
                                        Text(
                                          '${viewModel.chestPoints[viewModel.chestPool[index]]}',
                                          style: TextStyles.buttonText.copyWith(
                                            color: kcSecondaryColor,
                                            height: 1,
                                            letterSpacing: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Assets.images.revealCard.image(height: 112.h),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpace16,
            verticalSpace04,
            Text(
              'Pick one of the five cards and reveal your chestbox reward.',
              style: TextStyles.titleTertiary.copyWith(color: kcSecondaryColor),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.icons.coin.image(width: 18.w),
                horizontalSpace04,
                Text(
                  '${viewModel.totalPoints}',
                  style: TextStyles.titleSecondary.copyWith(
                    color: kcPrimaryColor,
                    fontSize: 22.sp,
                    height: 1.727.h,
                  ),
                ),
              ],
            ),
            Text(
              'Points earned from this game',
              style: TextStyles.titleSecondary.copyWith(
                color: kcPrimaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            verticalSpace16,
            verticalSpace04,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) {
                return index < viewModel.selectedChests.length
                    ? ChestBox(
                        imagePath: viewModel
                            .getImagePath(viewModel.selectedChests[index]),
                        points: viewModel
                            .chestPoints[viewModel.selectedChests[index]],
                      )
                    : const ChestBox(
                        imagePath: null,
                        points: null,
                      );
              }),
            ),
            verticalSpace16,
            verticalSpace04,
            PrimaryButton(
              onPressed:
                  viewModel.hasRevealedCard() ? viewModel.nextRound : null,
              text: viewModel.round == 5 ? 'Level Up' : 'Next Round',
            ),
          ],
        ),
      ),
    );
  }

  @override
  PlayViewModel viewModelBuilder(BuildContext context) => PlayViewModel();

  @override
  void onViewModelReady(PlayViewModel viewModel) {
    viewModel.generateChests();
    super.onViewModelReady(viewModel);
  }
}

class ChestWidget extends StatelessWidget {
  final String chest;

  const ChestWidget({super.key, required this.chest});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(chest),
      ),
    );
  }
}
