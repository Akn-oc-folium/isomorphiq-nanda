import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:isomorph_iq_nanda/gen/assets.gen.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
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
  void onViewModelReady(GeneratedTweetSheetModel viewModel) {
    viewModel.initialise(
        tweetText: request.description ?? '',
        tweetId: request.data['tweetId'],
        type: request.data['type'],
        header: request.data['header'],
        handle: request.data['handle']);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(
    BuildContext context,
    GeneratedTweetSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                viewModel.sheetType == TweetSheetType.generated
                    ? 'Generated Tweet'
                    : 'Tagged Tweet',
                style:
                    TextStyles.titleSecondary.copyWith(color: kcPrimaryColor),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () => completer!(SheetResponse()),
                  icon: SvgPicture.asset(
                    Assets.icons.close,
                    width: 24.r,
                    height: 24.r,
                    colorFilter: const ColorFilter.mode(
                        kcSecondaryColor, BlendMode.srcIn),
                  ),
                ),
              ),
            ],
          ),
          verticalSpace08,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              color: kcPrimaryColorLight,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (viewModel.sheetType == TweetSheetType.generated) ...[
                      Text(
                        viewModel.headerLabel ?? '',
                        style: TextStyles.titleSecondary
                            .copyWith(color: kcSecondaryColor),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit, color: kcSecondaryColor),
                        onPressed: viewModel.toggleEditing,
                      ),
                    ] else ...[
                      Text(
                        viewModel.handle ?? '',
                        style: TextStyles.titleSecondary
                            .copyWith(color: kcSecondaryColor),
                      ),
                    ]
                  ],
                ),
                verticalSpace08,
                TextField(
                  controller: viewModel.tweetController,
                  readOnly: !viewModel.isEditing,
                  maxLength: 280,
                  maxLines: null,
                  style:
                      TextStyles.bodyPrimary.copyWith(color: kcSecondaryColor),
                  decoration: const InputDecoration.collapsed(
                    hintText: "Enter your tweet...",
                  ),
                ),
              ],
            ),
          ),
          verticalSpace16,
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: kcPrimaryColor),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  icon: const Icon(Icons.delete_outline),
                  color: kcSecondaryColor,
                  onPressed: () {},
                ),
              ),
              horizontalSpace16,
              Expanded(
                child: PrimaryButton(
                  text: "Tweet Now",
                  onPressed: viewModel.sendTweet,
                  isBusy: viewModel.busy('tweet'),
                  points: 5,
                ),
              ),
            ],
          ),
          verticalSpace08,
        ],
      ),
    );
  }

  @override
  GeneratedTweetSheetModel viewModelBuilder(BuildContext context) =>
      GeneratedTweetSheetModel();
}
