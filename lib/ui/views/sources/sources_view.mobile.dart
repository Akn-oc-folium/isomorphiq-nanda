import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/widgets/connect_card.dart';
import 'package:stacked/stacked.dart';

import 'sources_viewmodel.dart';

class SourcesViewMobile extends ViewModelWidget<SourcesViewModel> {
  const SourcesViewMobile({super.key});

  @override
  Widget build(BuildContext context, SourcesViewModel viewModel) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 36.h,
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
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0.h),
          child: TabBarView(
            children: [
              GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 12.w,
                crossAxisCount: 2,
                children: [
                  ConnectCard(
                    title: 'Google',
                    imagePath: Assets.icons.googleLogo.path,
                    onConnect: () => viewModel.connectToGoogle(),
                    isConnected: viewModel.isConnected,
                  ),
                  ConnectCard(
                    title: 'Telegram',
                    imagePath: Assets.icons.telegramLogo.path,
                    onConnect: () {},
                    isConnected: true,
                  ),
                  ConnectCard(
                    title: 'X',
                    imagePath: Assets.icons.xLogo.path,
                    onConnect: () => viewModel.connectToTwitter(),
                  ),
                  ConnectCard(
                    title: 'Discord',
                    imagePath: Assets.icons.discordLogo.path,
                    onConnect: () => viewModel.connectToDiscord(),
                  ),
                  ConnectCard(
                    title: 'Facebook',
                    imagePath: Assets.icons.discordLogo.path,
                    onConnect: () => viewModel.connectToFacebook(),
                  ),
                ],
              ),
              GridView.count(
                padding: const EdgeInsets.symmetric(horizontal: 24.0).w,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 12.w,
                crossAxisCount: 2,
                children: [
                  ConnectCard(
                    title: 'Metamask',
                    imagePath: Assets.icons.metamaskLogo.path,
                    onConnect: () {},
                  ),
                  ConnectCard(
                    title: 'Binance',
                    imagePath: Assets.icons.binanceLogo.path,
                    onConnect: () {},
                  ),
                  ConnectCard(
                    title: 'Uniswap',
                    imagePath: Assets.icons.uniswapLogo.path,
                    onConnect: () {},
                  ),
                  ConnectCard(
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
  }
}
