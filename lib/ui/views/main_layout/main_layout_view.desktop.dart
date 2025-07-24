import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutViewDesktop extends ViewModelWidget<MainLayoutViewModel> {
  final Widget body;
  final bool showRightPanel;
  final Widget? rightPanel;
  const MainLayoutViewDesktop({
    super.key,
    required this.body,
    this.showRightPanel = false,
    this.rightPanel,
  });

  @override
  Widget build(BuildContext context, MainLayoutViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kcPrimaryColorLight,
        centerTitle: true,
        title: Text('NANDA',
            style: TextStyles.titleSecondary
                .copyWith(color: kcSecondaryColor, fontSize: 20.sp)),
      ),
      body: Row(
        children: [
          SizedBox(width: 490.w),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: showRightPanel ? 0 : 490.w),
              child: body,
            ),
          ),
          if (showRightPanel) ...[
            Padding(
              padding: EdgeInsets.only(left: 22.0.r),
              child: Container(width: 1.w, color: kcStrokePrimary),
            ),
            SizedBox(
              width: 490.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.r, vertical: 62.r),
                child: rightPanel,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
