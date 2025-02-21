import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'rewards_sheet_model.dart';

class RewardsSheet extends StackedView<RewardsSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const RewardsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    RewardsSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.all(24).r,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(24).r,
          topRight: const Radius.circular(24).r,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          // GestureDetector(
          //   onTap: () => completer!(SheetResponse()),
          //   child: SvgPicture.asset(
          //     Assets.icons.close,
          //     width: 24,
          //     height: 24,
          //     colorFilter:
          //         const ColorFilter.mode(kcSecondaryColor, BlendMode.srcIn),
          //   ),
          // ),
          Column(
            children: [
              Image.asset(
                request.imageUrl!,
                // width: double.infinity,
                // height: 186,
              ),
              verticalSpace16,
              Text(
                request.title!,
                style: TextStyles.titlePrimary.copyWith(
                  color: kcPrimaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              if (request.description != null) ...[
                verticalSpace16,
                Text(
                  request.description!,
                  style: TextStyles.titleSecondary.copyWith(
                    color: kcSecondaryColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  softWrap: true,
                ),
              ],
              verticalSpace16,
              SecondaryButton(
                text: request.secondaryButtonTitle!,
                onPressed: () {
                  // viewModel.navigateToJackpot();
                  completer!(SheetResponse(confirmed: true));
                },
              ),
              verticalSpace16,
              PrimaryButton(
                text: request.mainButtonTitle!,
                onPressed: () {
                  // viewModel.navigateToSources(
                  //     totalPoints: request.data['points']);
                  completer!(SheetResponse(confirmed: true));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  RewardsSheetModel viewModelBuilder(BuildContext context) =>
      RewardsSheetModel();

  @override
  bool get reactive => true;
}
