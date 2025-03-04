import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'generated_tweet_sheet_model.dart';

class GeneratedTweetSheet extends StackedView<GeneratedTweetSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const GeneratedTweetSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    GeneratedTweetSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () => completer!(SheetResponse()),
              icon: SvgPicture.asset(
                Assets.icons.close,
                width: 24.r,
                height: 24.r,
                colorFilter:
                    const ColorFilter.mode(kcSecondaryColor, BlendMode.srcIn),
              ),
              iconSize: 24.r,
            ),
          ),
          Text(
            request.title!,
            style: TextStyles.titleSecondary.copyWith(color: kcPrimaryColor),
          ),
          if (request.description != null) ...[
            verticalSpace16,
            Text(
              request.description!,
              style: TextStyles.bodyPrimary,
              softWrap: true,
            ),
            verticalSpace16,
            Row(
              children: [
                SecondaryButton.icon(
                  icon: SvgPicture.asset(
                    Assets.icons.save,
                    height: 24.r,
                    colorFilter: const ColorFilter.mode(
                        kcSecondaryColor, BlendMode.srcIn),
                  ),
                  onPressed: () => viewModel.sendGeneratedTweet('PENDING'),
                ),
                horizontalSpace16,
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    text: "Tweet Now",
                    onPressed: () => viewModel.sendGeneratedTweet('APPROVED'),
                    isBusy: viewModel.busy('tweetNow'),
                  ),
                ),
              ],
            )
          ],
          verticalSpace04,
        ],
      ),
    );
  }

  @override
  GeneratedTweetSheetModel viewModelBuilder(BuildContext context) =>
      GeneratedTweetSheetModel(generatedTweet: request.description ?? '');
}
