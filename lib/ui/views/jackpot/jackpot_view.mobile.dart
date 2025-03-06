import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:isomorph_iq/ui/widgets/leaderboard_row.dart';
import 'package:isomorph_iq/ui/widgets/telegram_share.dart';
import 'package:stacked/stacked.dart';

import 'jackpot_viewmodel.dart';

class JackpotViewMobile extends StackedView<JackpotViewModel> {
  const JackpotViewMobile({super.key});

  @override
  Widget builder(
      BuildContext context, JackpotViewModel viewModel, Widget? child) {
    return Scaffold(
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
          : Column(
              children: [
                verticalSpace16,

                // Invite Friends Card
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 10.0)
                      .r,
                  decoration: BoxDecoration(
                    color: kcPrimaryColorLight,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: kcStrokePrimary,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.icons.atTheRate.path,
                          width: 62.w, height: 67.h),
                      horizontalSpace08,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Invite Friends',
                              style: TextStyles.titleSecondary
                                  .copyWith(color: kcSecondaryColor),
                            ),
                            verticalSpace04,
                            Text(
                              'The more users chat, the bigger the jackpot grows!',
                              style: TextStyles.bodySecondary.copyWith(
                                color: kcSecondaryColor,
                                height: 1.33.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace08,
                      PrimaryButton.icon(
                        icon: SvgPicture.asset(
                          Assets.icons.arrowRight,
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {
                          TelegramShare.shareInviteLink(viewModel.username);
                        },
                      ),
                    ],
                  ),
                ),
                verticalSpace16,
                verticalSpace04,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.centerLeft,
                    children: [
                      PrimaryButton(
                        text: "Play Game",
                        onPressed: viewModel.userLevel == null ||
                                viewModel.userLevel == 1
                            ? null
                            : viewModel.enterPlayMode,
                      ),
                      if (viewModel.userLevel == null ||
                          viewModel.userLevel == 1) ...[
                        Positioned(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: SvgPicture.asset(Assets.icons.lock),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                verticalSpace(10),
                if (viewModel.userLevel == null || viewModel.userLevel == 1)
                  Text(
                    'Level up to unlock game and start playing to earn!',
                    style: TextStyles.bodyPrimary
                        .copyWith(color: kcSecondaryColor),
                  ),
                verticalSpace16,
                verticalSpace04,
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    decoration: const BoxDecoration(
                      color: kcPrimaryColorLight,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          child: Text(
                            'Leaderboard',
                            style: TextStyles.titleSecondary.copyWith(
                              fontSize: 20,
                              color: kcSecondaryColor,
                              height: 0.9,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Transform.rotate(
                            angle: 0,
                            child: Assets.images.trophy2x.image(
                              height: 100,
                              width: 100,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 34,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  kcPrimaryColorLight.withValues(alpha: 0.0),
                                  kcPrimaryColorLight,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 74,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 260,
                            child: ScrollConfiguration(
                              behavior:
                                  ScrollConfiguration.of(context).copyWith(
                                scrollbars: false,
                              ),
                              child: ListView.builder(
                                itemCount: viewModel
                                    .leaderboard.data.leaderBoard.length,
                                itemBuilder: (context, index) {
                                  return LeaderboardRow(
                                    index: index + 1,
                                    name: viewModel.leaderboard.data
                                        .leaderBoard[index].name,
                                    score: viewModel.leaderboard.data
                                        .leaderBoard[index].points,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  JackpotViewModel viewModelBuilder(BuildContext context) => JackpotViewModel();

  @override
  void onViewModelReady(JackpotViewModel viewModel) => viewModel.initState();
}
