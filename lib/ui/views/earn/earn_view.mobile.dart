import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/gen/fonts.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:isomorph_iq/ui/widgets/streak_redeem_card.dart';
import 'package:isomorph_iq/ui/widgets/task_card.dart';
import 'package:isomorph_iq/ui/widgets/user_status_card.dart';
import 'package:stacked/stacked.dart';

import 'earn_viewmodel.dart';

class EarnViewMobile extends StackedView<EarnViewModel> {
  const EarnViewMobile({super.key});

  @override
  Widget builder(BuildContext context, EarnViewModel viewModel, child) {
    return Scaffold(
      body: viewModel.isBusy || viewModel.userProfile == null
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
          : Padding(
              padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 14.0, bottom: 18.0)
                  .r,
              child: Column(
                children: [
                  viewModel.userRank == null ||
                          viewModel.userRank!.data.rank == 0
                      ? SizedBox(
                          height: 20.r,
                          width: 20.r,
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor:
                                kcPrimaryColor.withValues(alpha: 0.5),
                            strokeWidth: 2.0.w,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              kcPrimaryColor,
                            ),
                          ),
                        )
                      : UserStatusCard(
                          name: viewModel.userProfile!.data.telegramHandle,
                          rank: viewModel.userRank!.data.rank,
                        ),
                  verticalSpace08,
                  verticalSpace04,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StreakRedeemCard(
                        onRedeem: (tap) => viewModel.onClickStreakRedeem(),
                      ),
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 38.r,
                            width: 38.r,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              image: DecorationImage(
                                image: AssetImage(Assets.icons.starLevel.path),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Text(
                              '1',
                              style: TextStyles.titleTertiary.copyWith(
                                color: kcWhite,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          horizontalSpace04,
                          Text(
                            'Level',
                            style: TextStyles.titleTertiary.copyWith(
                              color: const Color(0xFF6F53FD),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    'Total Points Earned',
                    style: TextStyles.titleSecondary
                        .copyWith(color: kcSecondaryColor),
                  ),
                  verticalSpace08,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        Assets.icons.coin.path,
                        height: 62.h,
                      ),
                      horizontalSpace08,
                      horizontalSpace04,
                      Text(
                        viewModel.userProfile!.data.points.toString(),
                        style: TextStyle(
                          fontSize: 44.r,
                          fontWeight: FontWeight.w600,
                          fontFamily: FontFamily.sora,
                          height: 1.8.h,
                        ),
                      ),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     ChestBox(
                  //       imagePath: Assets.images.chestLevel1Closed.path,
                  //       onTap: viewModel.openRewardsSheet,
                  //     ),
                  //     const ChestBox(
                  //       imagePath: null,
                  //     ),
                  //     const ChestBox(
                  //       imagePath: null,
                  //     ),
                  //   ],
                  // ),
                  const Spacer(),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 16)
                            .r,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12).r,
                      color: kcPrimaryColorLight,
                    ),
                    child: Column(
                      children: [
                        TaskCard(
                          title: viewModel.userProfile!.data.appTasks.first
                              .assignments.first.description,
                          isDone: viewModel.taskCompletionStatus[0],
                          onTap: viewModel.taskCompletionStatus[0]
                              ? null
                              : () => viewModel.markTaskAsDone(0),
                        ),
                        verticalSpace08,
                        TaskCard(
                          title: viewModel.userProfile!.data.appTasks.first
                              .assignments[1].description,
                          isDone: viewModel.taskCompletionStatus[1],
                          onTap: viewModel.taskCompletionStatus[1]
                              ? null
                              : () => viewModel.markTaskAsDone(1),
                        ),
                        verticalSpace08,
                        TaskCard(
                          title: viewModel.userProfile!.data.appTasks.first
                              .assignments.last.description,
                          isDone: viewModel.taskCompletionStatus[2],
                          onTap: viewModel.taskCompletionStatus[2]
                              ? null
                              : () => viewModel.markTaskAsDone(2),
                        ),
                      ],
                    ),
                  ),
                  verticalSpace16,
                  PrimaryButton(
                    text: 'Level Up to Play Game',
                    onPressed: viewModel.areAllTasksDone ? () {} : null,
                  ),
                ],
              ),
            ),
    );
  }

  @override
  EarnViewModel viewModelBuilder(BuildContext context) => EarnViewModel();

  @override
  void onViewModelReady(EarnViewModel viewModel) {
    viewModel.initialise();
    super.onViewModelReady(viewModel);
  }
}
