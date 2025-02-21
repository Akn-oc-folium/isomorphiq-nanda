import 'package:flutter/material.dart';
import 'package:isomorph_iq/ui/common/app_colors.dart';
import 'package:isomorph_iq/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'game_instruction_sheet_model.dart';

class GameInstructionSheet extends StackedView<GameInstructionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const GameInstructionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    GameInstructionSheetModel viewModel,
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
          Text(
            request.title ?? 'Hello Stacked Sheet!!',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          if (request.description != null) ...[
            verticalSpace08,
            Text(
              request.description!,
              style: const TextStyle(fontSize: 14, color: kcSecondaryColor),
              maxLines: 3,
              softWrap: true,
            ),
          ],
          verticalSpace16,
        ],
      ),
    );
  }

  @override
  GameInstructionSheetModel viewModelBuilder(BuildContext context) =>
      GameInstructionSheetModel();
}
