import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/gen/fonts.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';
import 'package:isomorph_iq_nanda/ui/views/agents/agents_view.dart';
import 'package:isomorph_iq_nanda/ui/views/home/home_view.dart';
import 'package:isomorph_iq_nanda/ui/views/jackpot/jackpot_view.dart';
import 'package:stacked/stacked.dart';

import 'main_viewmodel.dart';

class MainViewMobile extends StatelessWidget {
  const MainViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => MainViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: viewModel.currentIndex,
          onDestinationSelected: viewModel.setIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          destinations: [
            getCustomizedNavItem(
              index: 0,
              selectedIndex: viewModel.currentIndex,
              iconPath: Assets.icons.home,
              label: ksHomeNavTitle,
            ),
            getCustomizedNavItem(
              index: 1,
              selectedIndex: viewModel.currentIndex,
              iconPath: Assets.icons.logoStatic.path,
              label: ksAgentNavTitle,
            ),
            getCustomizedNavItem(
              index: 2,
              selectedIndex: viewModel.currentIndex,
              iconPath: Assets.icons.jackpot,
              label: ksJackpotNavTitle,
            ),
          ],
        ),
        body: getViewForIndex(viewModel.currentIndex),
      ),
    );
  }

  Container getCustomizedNavItem({
    required int index,
    required int selectedIndex,
    required String iconPath,
    required String label,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: selectedIndex == index
            ? LinearGradient(
                colors: [
                  kcPrimaryColor.withValues(alpha: 0.24),
                  kcPrimaryColor.withValues(alpha: 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
            : null,
        border: selectedIndex == index
            ? const Border(
                top: BorderSide(color: kcPrimaryColor, width: 3.0),
              )
            : const Border(
                top: BorderSide(color: Colors.transparent, width: 3.0),
              ),
        borderRadius: selectedIndex == index
            ? const BorderRadius.only(
                topLeft: Radius.circular(2.0),
                topRight: Radius.circular(2.0),
              )
            : null,
      ),
      child: NavigationDestination(
        label: '',
        icon: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: selectedIndex == index ? 1.0 : 0.5,
              child: iconPath == Assets.icons.logoStatic.path
                  ? Image.asset(
                      iconPath,
                      height: 24.r,
                    )
                  : SvgPicture.asset(
                      iconPath,
                      height: 24.r,
                    ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.sora,
                height: 1.66.h,
                color: selectedIndex == index
                    ? kcWhite
                    : kcWhite.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeView(key: UniqueKey());
      case 1:
        return const AgentsView();
      case 2:
        return const JackpotView();
    }
    return HomeView(key: UniqueKey());
  }
}
