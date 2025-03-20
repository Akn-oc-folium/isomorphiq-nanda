import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isomorph_iq/gen/assets.gen.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/text_styles.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:isomorph_iq/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'connect_app_sheet_model.dart';

class ConnectAppSheet extends StackedView<ConnectAppSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ConnectAppSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    ConnectAppSheetModel viewModel,
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Spacer(),
                GestureDetector(
                  onTap: () => completer!(SheetResponse(confirmed: false)),
                  child: Icon(Icons.close, size: 24),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Image.asset(
                    Assets.icons.xLogo.path,
                    width: 40.r,
                    height: 40.r,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    "Connect ${request.title!}",
                    style: TextStyles.titlePrimary
                        .copyWith(color: kcSecondaryColor),
                  ),
                ],
              ),
            ),
            verticalSpace16,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.5),
              child: Text(
                "Connecting ${request.title} is worth 100 tokens",
                style:
                    TextStyles.titleSecondary.copyWith(color: kcPrimaryColor),
              ),
            ),
            Text(
              'Your data is temporary used and deleted. Once connected you can interact with the app specific AI Agents.',
              style: TextStyles.titleTertiary,
            ),
            verticalSpace16,
            PrimaryButton(
                text: 'Connect',
                onPressed: () => viewModel.connectApp(request.data?.provider)),
          ],
        ),
      ),
    );
  }

  @override
  ConnectAppSheetModel viewModelBuilder(BuildContext context) =>
      ConnectAppSheetModel(userId: request.data?.userId);
}
