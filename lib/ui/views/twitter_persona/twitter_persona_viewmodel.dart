import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.bottomsheets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/models/tweets_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TwitterPersonaViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  TextEditingController topicController = TextEditingController();

  Tweets? _tweets;
  Tweets? get tweets => _tweets;

  bool isFilterDropdownVisible = false;

  List<String> filterOptions = ["Pending", "Approved", "Latest"];

  String selectedFilter = "Pending";

  String? _generatedTweet;
  String? get generatedTweet => _generatedTweet;

  String? _userId;
  String? get userId => _userId;

  void toggleFilterDropdown() {
    isFilterDropdownVisible = !isFilterDropdownVisible;
    notifyListeners();
  }

  void applyFilter(String option) {
    selectedFilter = option;
    isFilterDropdownVisible = false;
    notifyListeners();
    fetchTweets();
  }

  Future<void> fetchTweets() async {
    setBusyForObject(_tweets, true);
    _userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      _tweets = await _apiService.getTweets(
        userId: _userId!,
        tweetStatus: selectedFilter.toUpperCase(),
      );
      if (selectedFilter.toUpperCase() ==
          TweetStatus.pending.name.toUpperCase()) {
        await _hiveService.storeData(kUserBox, kTweetCountsKey,
            _tweets!.data.isNotEmpty ? _tweets!.data.length : 0);
      }
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    } finally {
      setBusyForObject(_tweets, false);
    }
  }

  Future<void> generateTweet() async {
    setBusyForObject('generatingTweet', true);
    if (topicController.text.isNotEmpty) {
      try {
        final response = await _apiService.postGenerateTweet(
          userId: _userId!,
          topic: topicController.text.trim(),
        );

        _generatedTweet = response.data.content;
        topicController.clear();

        if (generatedTweet != null) {
          openGeneratedTweetModal();
        } else {
          debugPrint("Tweet is empty");
          _dialogService.showDialog(
            title: 'Error',
            description: 'Could not generate tweet. Please try again.',
          );
        }
      } catch (e) {
        debugPrint("Error fetching news: $e");
      } finally {
        setBusyForObject('generatingTweet', false);
      }
    }
  }

  void openGeneratedTweetModal() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.generatedTweet,
      barrierDismissible: false,
      title: 'Tweet you just generated',
      description: _generatedTweet,
      isScrollControlled: true,
    );
  }

  Future<void> updateTweetStatus(String tweetId, String tweetStatus) async {
    setBusyForObject('updatingTweetStatus', true);
    try {
      final response = await _apiService.postUpdateTweetStatus(
        userId: _userId!,
        tweetId: tweetId,
        tweetStatus: tweetStatus,
      );
      if ((tweetStatus == TweetStatus.rejected.name.toUpperCase() &&
              response.code == 200) ||
          (tweetStatus == TweetStatus.approved.name.toUpperCase() &&
              response.code == 200)) {
        int newCount =
            await _hiveService.retrieveData(kUserBox, kTweetCountsKey);
        await _hiveService.storeData(kUserBox, kTweetCountsKey, newCount - 1);
      }
      await fetchTweets();
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    } finally {
      setBusyForObject('updatingTweetStatus', false);
    }
  }

  void navigateToSettings() {
    _routerService.navigateToTweetSettingsView();
  }

  void navigateBack() => _routerService.back();
}
