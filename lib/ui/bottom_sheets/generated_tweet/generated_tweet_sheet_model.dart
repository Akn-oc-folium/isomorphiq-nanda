import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GeneratedTweetSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  GeneratedTweetSheetModel({required this.generatedTweet});

  late String generatedTweet;

  Future<void> sendGeneratedTweet(String tweetStatus) async {
    setBusyForObject('tweetNow', true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      debugPrint('saving, $generatedTweet');
      final response = await _apiService.postSaveGeneratedTweet(
        userId: userId, //'ff8bbd4e-6221-48a4-910f-b88c4978c5d5',
        content: generatedTweet,
        tweetStatus: tweetStatus,
      );
      if (response.code == 200) {
        _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
        rebuildUi();
      }
      else if (response.code == 429) {
        _dialogService.showDialog(
          title: 'Error',
          description: 'You have reached the limit of posting tweets per day.',
        );
      }
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    } finally {
      setBusyForObject('tweetNow', false);
    }
  }
}
