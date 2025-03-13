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

  List<Tweet>? _tweets;
  List<Tweet>? get tweets => _tweets;

  bool isFilterDropdownVisible = false;

  List<String> filterOptions = ["Pending", "Approved"];

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
    setBusyForObject("tweetsFetching", true);
    _userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getTweets(
        userId: _userId!,
        tweetStatus: selectedFilter.toUpperCase(),
      );
      _tweets = response.data;

      if (selectedFilter == "Pending") {
        await _hiveService.storeData(
            kUserBox, kTweetCountsKey, _tweets != null ? _tweets!.length : 0);
      }
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    } finally {
      setBusyForObject("tweetsFetching", false);
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

  void openGeneratedTweetModal() async {
    var response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.generatedTweet,
      barrierDismissible: false,
      title: 'Tweet you just generated',
      description: _generatedTweet,
      isScrollControlled: true,
    );
    if (response?.confirmed ?? false) {
      await fetchTweets();
    }
  }

  Future<void> updateTweetStatus(String tweetId, String tweetStatus) async {
    setBusyForObject('updatingTweetStatus', true);
    try {
      final response = await _apiService.postUpdateTweetStatus(
        userId:  _userId!,
        tweetId: tweetId,
        tweetStatus: tweetStatus,
      );
      if (response.code == 200) {
        if (tweetStatus == TweetStatus.rejected.name.toUpperCase() ||
            tweetStatus == TweetStatus.approved.name.toUpperCase()) {
          int newCount =
              await _hiveService.retrieveData(kUserBox, kTweetCountsKey);
          await _hiveService.storeData(kUserBox, kTweetCountsKey, newCount - 1);
        }

        _tweets?.removeWhere((tweet) => tweet.id == tweetId);
        _tweets!.isEmpty ? _tweets = null : _tweets;
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
      setBusyForObject('updatingTweetStatus', false);
    }
  }

  void navigateToSettings() {
    _routerService.navigateToTweetSettingsView();
  }

  void navigateBack() => _routerService.back();
}
