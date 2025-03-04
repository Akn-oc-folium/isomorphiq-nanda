import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.bottomsheets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/models/tweets_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsTwitterPersonaViewModel extends BaseViewModel {
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
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      _tweets = await _apiService.getTweets(
        userId: userId, // 'cc23fa3d-beca-49db-8f04-1f0c6a8cbfec',
        tweetStatus: selectedFilter.toUpperCase(),
      );
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    } finally {
      setBusyForObject(_tweets, false);
    }
  }

  Future<void> generateTweet() async {
    setBusyForObject('generatingTweet', true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    if (topicController.text.isNotEmpty) {
      try {
        final response = await _apiService.postGenerateTweet(
          userId: userId, //'cc23fa3d-beca-49db-8f04-1f0c6a8cbfec',
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
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      await _apiService.postUpdateTweetStatus(
        userId: userId, //'cc23fa3d-beca-49db-8f04-1f0c6a8cbfec',
        tweetId: tweetId,
        tweetStatus: tweetStatus,
      );
      await fetchTweets();
      rebuildUi();
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
