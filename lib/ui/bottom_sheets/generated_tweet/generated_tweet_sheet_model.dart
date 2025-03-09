import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
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
        userId: userId,
        content: generatedTweet,
        tweetStatus: tweetStatus,
      );
      if (response.code == 200) {
        _bottomSheetService.completeSheet(SheetResponse(confirmed: true));
        if (tweetStatus == TweetStatus.pending.name.toUpperCase()) {
          int newCount =
              await _hiveService.retrieveData(kUserBox, kTweetCountsKey);
          await _hiveService.storeData(kUserBox, kTweetCountsKey, newCount + 1);
        }
      } else if (response.code == 429) {
        _dialogService.showDialog(
          title: 'Error',
          description: 'You have reached the limit of posting tweets per day.',
        );
      } else if (response.code == 500) {
        _dialogService.showDialog(
          title: 'Error',
          description: 'You need to connect your X account to post tweets.',
        );
      } else {
        _dialogService.showDialog(
          title: 'Error',
          description: 'Could not save tweet. Please try again.',
        );
      }
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    } finally {
      setBusyForObject('tweetNow', false);
      rebuildUi();
    }
  }
}
