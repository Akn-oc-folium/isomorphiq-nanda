import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/app_constants.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/views/main_layout/main_layout_view.dart';
import 'package:isomorph_iq_nanda/ui/widgets/connect_card.dart';
import 'package:stacked/stacked.dart';

import 'sources_viewmodel.dart';

class SourcesViewDesktop extends StatelessWidget {
  const SourcesViewDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SourcesViewModel>.reactive(
      viewModelBuilder: () => SourcesViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) {
        return DefaultTabController(
          length: 2,
          child: MainLayoutView(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace16,
                  verticalSpace08,
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.arrow_back_ios, size: 30.r),
                        color: kcSecondaryColor,
                      ),
                      horizontalSpace04,
                      Text(
                        "Your Sources",
                        style: TextStyles.titlePrimary.copyWith(
                          color: kcSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  verticalSpace16,
                  verticalSpace08,
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: kcPrimaryColorLight.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      labelColor: kcWhite,
                      unselectedLabelColor: kcSecondaryColor,
                      tabs: const [
                        Tab(text: 'Web 2.0'),
                        Tab(text: 'Web 3.0'),
                      ],
                    ),
                  ),
                  verticalSpace16,
                  verticalSpace16,
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildWeb2Grid(viewModel),
                        _buildWeb3Grid(viewModel),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWeb2Grid(SourcesViewModel viewModel) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 24.w,
      childAspectRatio: 1,
      children: [
        ConnectCard(
          title: AuthProvider.google.title,
          imagePath: Assets.icons.googleLogo.path,
          onConnect: () => viewModel.connectApp(AuthProvider.google),
          isConnected: viewModel.connectedApps[AuthProvider.google] ??
              viewModel.appConnections!.data!.gmail,
          isBusy: viewModel.loadingState[AuthProvider.google] ?? false,
          points: 50,
        ),
        ConnectCard(
          title: AuthProvider.telegram.title,
          imagePath: Assets.icons.telegramLogo.path,
          onConnect: () {},
          isConnected: viewModel.connectedApps[AuthProvider.telegram] ?? false,
          isBusy: viewModel.loadingState[AuthProvider.telegram] ?? false,
          points: 50,
        ),
        ConnectCard(
          title: AuthProvider.x.title,
          imagePath: Assets.icons.xLogo.path,
          onConnect: () => viewModel.connectApp(AuthProvider.x),
          isConnected: viewModel.connectedApps[AuthProvider.x] ??
              viewModel.appConnections!.data!.twitter,
          isBusy: viewModel.loadingState[AuthProvider.x] ?? false,
          points: 50,
        ),
        ConnectCard(
          title: AuthProvider.discord.title,
          imagePath: Assets.icons.discordLogo.path,
          onConnect: () => viewModel.connectApp(AuthProvider.discord),
          isConnected: viewModel.connectedApps[AuthProvider.discord] ??
              viewModel.appConnections!.data!.discord,
          isBusy: viewModel.loadingState[AuthProvider.discord] ?? false,
          points: 50,
        ),
      ],
    );
  }

  Widget _buildWeb3Grid(SourcesViewModel viewModel) {
    return GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 24.h,
      crossAxisSpacing: 24.w,
      childAspectRatio: 1,
      children: [
        ConnectCard.comingSoon(
          title: 'Metamask',
          imagePath: Assets.icons.metamaskLogo.path,
          onConnect: () {},
        ),
        ConnectCard.comingSoon(
          title: 'Binance',
          imagePath: Assets.icons.binanceLogo.path,
          onConnect: () {},
        ),
        ConnectCard.comingSoon(
          title: 'Uniswap',
          imagePath: Assets.icons.uniswapLogo.path,
          onConnect: () {},
        ),
        ConnectCard.comingSoon(
          title: 'Warpcast',
          imagePath: Assets.icons.warpcastLogo.path,
          onConnect: () {},
        ),
      ],
    );
  }
}
