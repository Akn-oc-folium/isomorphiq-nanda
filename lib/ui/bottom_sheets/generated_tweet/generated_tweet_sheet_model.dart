import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/hive_service.dart';
import 'package:isomorph_iq_nanda/ui/common/app_constants.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum TweetSheetType { generated, tagged }

class GeneratedTweetSheetModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  TextEditingController tweetController = TextEditingController();

  bool isEditing = false;
  TweetSheetType sheetType = TweetSheetType.generated;
  String? tweetId;
  String? headerLabel;
  String? handle;

  void initialise({
    required String tweetText,
    required TweetSheetType type,
    String? tweetId,
    String? header,
    String? handle,
  }) {
    tweetController = TextEditingController(text: tweetText);
    sheetType = type;
    this.tweetId = tweetId;
    this.headerLabel = header;
    this.handle = handle;
  }

  void toggleEditing() {
    isEditing = !isEditing;
    notifyListeners();
  }

  Future<void> sendGeneratedTweet(String tweetStatus) async {
    final key =
        tweetStatus.toUpperCase() == TweetStatus.approved.name.toUpperCase()
            ? 'tweet'
            : 'save';

    setBusyForObject(key, true);

    try {
      final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);

      final response = await _apiService.postSaveGeneratedTweet(
        userId: userId,
        content: tweetController.text,
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
      debugPrint('Error saving tweet: $e');
    } finally {
      setBusyForObject(key, false);
      rebuildUi();
    }
  }

  void sendTweet() =>
      sendGeneratedTweet(TweetStatus.approved.name.toUpperCase());

  void saveGeneratedTweet() =>
      sendGeneratedTweet(TweetStatus.pending.name.toUpperCase());

  void startDiscussion() {
    _bottomSheetService.completeSheet(
      SheetResponse(confirmed: true, data: {
        'startDiscussion': true,
        'tweetId': tweetId,
      }),
    );
  }
}
