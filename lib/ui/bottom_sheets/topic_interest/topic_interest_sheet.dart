import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/ui/bottom_sheets/topic_interest/topic_interest_sheet_model.dart';
import 'package:isomorph_iq_nanda/ui/common/app_colors.dart';
import 'package:isomorph_iq_nanda/ui/common/text_styles.dart';
import 'package:isomorph_iq_nanda/ui/common/ui_helpers.dart';
import 'package:isomorph_iq_nanda/ui/widgets/buttons.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TopicInterestSheet extends StackedView<TopicInterestSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const TopicInterestSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(
    BuildContext context,
    TopicInterestSheetModel viewModel,
    Widget? child,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            request.title!,
            style: TextStyles.titleSecondary
                .copyWith(color: kcSecondaryColor, fontSize: 20),
          ),
          verticalSpace16,
          ...viewModel.topics.keys.map((category) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category, style: TextStyles.titleTertiary),
                verticalSpace04,
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: viewModel.topics[category]!.map((topic) {
                    return Chip(
                      label: Text(
                        topic,
                        style: TextStyles.titleTertiary
                            .copyWith(fontSize: 12, color: kcWhite),
                      ),
                      backgroundColor: kcPrimaryColor,
                      deleteIcon: Icon(
                        Icons.close,
                        size: 18,
                        color: kcWhite,
                      ),
                      onDeleted: () => viewModel.removeTopic(category, topic),
                    );
                  }).toList(),
                ),
                verticalSpace04,
                verticalSpace16
              ],
            );
          }),
          TextField(
            controller: viewModel.topicController,
            decoration: InputDecoration(
              hintText: "Input your own interest...",
              hintStyle: TextStyles.bodyPrimary.copyWith(color: kcPrimaryColor),
              suffixIcon: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (viewModel.topicController.text.isNotEmpty) {
                    viewModel.addTopic(viewModel.selectedCategory,
                        viewModel.topicController.text);
                    viewModel.clearTopicInput();
                  }
                },
              ),
              filled: true,
              fillColor: kcPrimaryColorLight,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: kcPrimaryColorLight)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: kcPrimaryColorLight)),
            ),
          ),
          verticalSpace16,
          PrimaryButton(
              text: "Done",
              onPressed: () => completer!(SheetResponse(confirmed: true)))
        ],
      ),
    );
  }

  @override
  TopicInterestSheetModel viewModelBuilder(BuildContext context) =>
      TopicInterestSheetModel(
          initialTopics: request.data as Map<String, List<String>>);
}
