import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/widgets/connect_card.dart';
import 'package:stacked/stacked.dart';

import 'sources_viewmodel.dart';

class SourcesViewMobile extends StatefulWidget {
  const SourcesViewMobile({super.key});

  @override
  State<SourcesViewMobile> createState() => _SourcesViewMobileState();
}

class _SourcesViewMobileState extends State<SourcesViewMobile> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SourcesViewModel(),
      onViewModelReady: (viewModel) => viewModel.initialise(),
      createNewViewModelOnInsert: true,
      builder: (context, viewModel, child) {
        return DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              title: const Text('Your Sources'),
              bottom: TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 24).w,
                tabs: [
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12).r,
                      ),
                      child: const Text('Web 2.0'),
                    ),
                  ),
                  Tab(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12).r,
                      ),
                      child: const Text('Web 3.0'),
                    ),
                  ),
                ],
              ),
            ),
            body: viewModel.isBusy || viewModel.appConnections == null
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
                    padding: EdgeInsets.symmetric(vertical: 24.0.h),
                    child: TabBarView(
                      children: [
                        GridView.count(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 24.0).w,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 12.w,
                          crossAxisCount: 2,
                          children: [
                            ConnectCard(
                              title: AuthProvider.google.title,
                              imagePath: Assets.icons.googleLogo.path,
                              onConnect: () =>
                                  viewModel.connectApp(AuthProvider.google),
                              isConnected: viewModel
                                      .connectedApps[AuthProvider.google]! ||
                                  viewModel.appConnections!.data!.gmail,
                              isBusy:
                                  viewModel.loadingState[AuthProvider.google] ??
                                      false,
                              points: 50,
                            ),
                            ConnectCard(
                              title: AuthProvider.telegram.title,
                              imagePath: Assets.icons.telegramLogo.path,
                              onConnect: () {},
                              isConnected: viewModel
                                  .connectedApps[AuthProvider.telegram],
                              isBusy: viewModel
                                      .loadingState[AuthProvider.telegram] ??
                                  false,
                            ),
                            ConnectCard(
                              title: AuthProvider.x.title,
                              imagePath: Assets.icons.xLogo.path,
                              onConnect: () =>
                                  viewModel.connectApp(AuthProvider.x),
                              isConnected:
                                  viewModel.connectedApps[AuthProvider.x]! ||
                                      viewModel.appConnections!.data!.twitter,
                              isBusy: viewModel.loadingState[AuthProvider.x] ??
                                  false,
                              points: 50,
                            ),
                            ConnectCard(
                              title: AuthProvider.discord.title,
                              imagePath: Assets.icons.discordLogo.path,
                              onConnect: () =>
                                  viewModel.connectApp(AuthProvider.discord),
                              isConnected: viewModel
                                      .connectedApps[AuthProvider.discord]! ||
                                  viewModel.appConnections!.data!.discord,
                              isBusy: viewModel
                                      .loadingState[AuthProvider.discord] ??
                                  false,
                              points: 50,
                            ),
                            ConnectCard(
                              title: AuthProvider.facebook.title,
                              imagePath: Assets.icons.facebookLogo.path,
                              onConnect: () =>
                                  viewModel.connectApp(AuthProvider.facebook),
                              isConnected: viewModel
                                      .connectedApps[AuthProvider.facebook]! ||
                                  viewModel.appConnections!.data!.facebook,
                              isBusy: viewModel
                                      .loadingState[AuthProvider.facebook] ??
                                  false,
                              points: 50,
                            ),
                            ConnectCard(
                              title: AuthProvider.spotify.title,
                              imagePath: Assets.icons.spotifyLogo.path,
                              onConnect: () =>
                                  viewModel.connectApp(AuthProvider.spotify),
                              isConnected: viewModel
                                      .connectedApps[AuthProvider.spotify]! ||
                                  viewModel.appConnections!.data!.spotify,
                              isBusy: viewModel
                                      .loadingState[AuthProvider.spotify] ??
                                  false,
                              points: 50,
                            ),
                            ConnectCard(
                              title: AuthProvider.reddit.title,
                              imagePath: Assets.icons.redditLogo.path,
                              onConnect: () =>
                                  viewModel.connectApp(AuthProvider.reddit),
                              isConnected: viewModel
                                      .connectedApps[AuthProvider.reddit]! ||
                                  viewModel.appConnections!.data!.reddit,
                              isBusy:
                                  viewModel.loadingState[AuthProvider.reddit] ??
                                      false,
                              points: 50,
                            ),
                          ],
                        ),
                        GridView.count(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 24.0).w,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 12.w,
                          crossAxisCount: 2,
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
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }
}
