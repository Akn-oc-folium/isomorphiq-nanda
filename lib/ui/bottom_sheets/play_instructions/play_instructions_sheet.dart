import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'play_instructions_sheet_model.dart';

class PlayInstructionsSheet extends StackedView<PlayInstructionsSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const PlayInstructionsSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    PlayInstructionsSheetModel viewModel,
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
          Row(
            children: [
              Text(
                request.title ?? 'Hello Stacked Sheet!!',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              GestureDetector(
                onTap: () => completer!(SheetResponse(confirmed: false)),
                child: Icon(Icons.close, color: Colors.brown),
              ),
            ],
          ),
          ...(request.data as List<Map<String, String>>).map((item) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    item["icon"]!,
                    width: 28,
                    height: 28,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item["content"]!,
                      style: TextStyle(fontSize: 16, color: Colors.brown[700]),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  @override
  PlayInstructionsSheetModel viewModelBuilder(BuildContext context) =>
      PlayInstructionsSheetModel();
}
