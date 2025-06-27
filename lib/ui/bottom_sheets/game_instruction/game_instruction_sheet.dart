import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'game_instruction_sheet_model.dart';

class GameInstructionSheet extends StackedView<GameInstructionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const GameInstructionSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    GameInstructionSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
      decoration: const BoxDecoration(
        color: kcPrimaryColorLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(request.title ?? 'Hello Stacked Sheet!!',
                  style:
                      TextStyles.titlePrimary.copyWith(color: kcPrimaryColor)),
              GestureDetector(
                onTap: () => completer!(SheetResponse(confirmed: false)),
                child: Icon(Icons.close, size: 24),
              ),
            ],
          ),
          if (request.data != null) ...[
            ...(request.data as List<Map<String, String>>).map((item) => Column(
                  children: [
                    verticalSpace16,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          item["icon"]!,
                          height: 40,
                          width: 40,
                        ),
                        horizontalSpace08,
                        Expanded(
                          child: Text(
                            item["content"]!,
                            style: TextStyles.titleTertiary,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
          verticalSpace16,
          PrimaryButton(
              text: "Continue",
              onPressed: () => completer!(SheetResponse(confirmed: false)))
        ],
      ),
    );
  }

  @override
  GameInstructionSheetModel viewModelBuilder(BuildContext context) =>
      GameInstructionSheetModel();
}
