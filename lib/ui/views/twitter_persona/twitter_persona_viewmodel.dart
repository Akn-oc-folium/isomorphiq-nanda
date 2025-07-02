import 'package:flutter/widgets.dart';
import 'package:isomorph_iq_nanda/app/app.bottomsheets.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/app/app.router.dart';
import 'package:isomorph_iq_nanda/models/tweets_model.dart';
import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/hive_service.dart';
import 'package:isomorph_iq_nanda/ui/common/app_constants.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TwitterPersonaViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  TextEditingController topicController = TextEditingController();
  Tweet? selectedTweet;
  TextEditingController editTweetController = TextEditingController();

  List<Tweet> _tweets = [
    Tweet(
      id: '14-abc123',
      userId: 'user001',
      tweetContent:
          'Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.',
      tweetStatus: 'PENDING',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      updatedAt: DateTime.now(),
    ),
    Tweet(
      id: '13-def456',
      userId: 'user001',
      tweetContent:
          'Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.',
      tweetStatus: 'EDITED',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      updatedAt: DateTime.now(),
    ),
    Tweet(
      id: '23-ghi789',
      userId: 'user001',
      tweetContent:
          'Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.',
      tweetStatus: 'APPROVED',
      createdAt: DateTime.now().subtract(Duration(days: 3)),
      updatedAt: DateTime.now(),
    ),
    Tweet(
      id: '14-abc123',
      userId: 'user001',
      tweetContent:
          'Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.',
      tweetStatus: 'PENDING',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      updatedAt: DateTime.now(),
    ),
    Tweet(
      id: '14-abc123',
      userId: 'user001',
      tweetContent:
          'Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.',
      tweetStatus: 'PENDING',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      updatedAt: DateTime.now(),
    ),
    Tweet(
      id: '14-abc123',
      userId: 'user001',
      tweetContent:
          'Pi Network, the closely followed tap-to-earn cryptocurrency network, launched its open mainnet today, Feb. 20, at 8 am UTC. The launch was a significant milestone for the project.',
      tweetStatus: 'PENDING',
      createdAt: DateTime.now().subtract(Duration(days: 1)),
      updatedAt: DateTime.now(),
    ),
  ];

  List<Tweet> get tweets => _tweets;

  bool isFilterDropdownVisible = false;

  List<String> filterOptions = ["Pending", "Approved"];

  String selectedFilter = "Pending";

  String _generatedTweet = "";
  String get generatedTweet => _generatedTweet;

  String? _userId;
  String? get userId => _userId;

  Future<void> initialize() async {
    _userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    await fetchTweets();
  }

  void toggleFilterDropdown() {
    isFilterDropdownVisible = !isFilterDropdownVisible;
    notifyListeners();
  }

  void applyFilter(String option) {
    selectedFilter = option;
    isFilterDropdownVisible = false;
    notifyListeners();
    debugPrint('Selected filter: $selectedFilter');
    fetchTweets();
  }

  Future<void> fetchTweets() async {
    setBusyForObject("tweetsFetching", true);
    debugPrint('User ID: $_userId');
    try {
      final response = await _apiService.getTweets(
        userId: _userId!,
        tweetStatus: selectedFilter.toUpperCase(),
      );
      _tweets = response.data ?? [];

      debugPrint('Fetched ${_tweets.length} tweets.');
      if (_tweets.isNotEmpty && selectedFilter == "Pending") {
        await _hiveService.storeData(kUserBox, kTweetCountsKey, _tweets.length);
      } else if (_tweets.isEmpty &&
          !await _hiveService.containsKey(kUserBox, kTweetCountsKey)) {
        await _hiveService.storeData(kUserBox, kTweetCountsKey, 0);
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

        if (generatedTweet.isNotEmpty) {
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

  void selectTweetForEdit(Tweet tweet) {
    selectedTweet = tweet;
    editTweetController.text = tweet.tweetContent;
    notifyListeners();
  }

  void closeEditPanel() {
    selectedTweet = null;
    notifyListeners();
  }

  void updateEditedTweet() {
    selectedTweet = null;
    notifyListeners();
  }

  Future<void> updateTweetStatus(String tweetId, String tweetStatus) async {
    setBusyForObject(
        tweetStatus.toUpperCase() == TweetStatus.rejected.name.toUpperCase()
            ? 'rejectingTweet${tweetId.split('-').first}'
            : 'updatingTweetStatus${tweetId.split('-').first}',
        true);
    try {
      final response = await _apiService.postUpdateTweetStatus(
        userId: _userId!,
        tweetId: tweetId,
        tweetStatus: tweetStatus,
      );
      if (response.code == 200) {
        int newCount =
            await _hiveService.retrieveData(kUserBox, kTweetCountsKey);
        await _hiveService.storeData(kUserBox, kTweetCountsKey, newCount - 1);

        _tweets.removeWhere((tweet) => tweet.id == tweetId);
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
      debugPrint('Error updating tweet: $e');
    } finally {
      setBusyForObject(
          tweetStatus.toUpperCase() == TweetStatus.rejected.name.toUpperCase()
              ? 'rejectingTweet${tweetId.split('-').first}'
              : 'updatingTweetStatus${tweetId.split('-').first}',
          false);
    }
  }

  void navigateToSettings() {
    _routerService.navigateToTweetSettingsView();
  }

  void navigateBack() => _routerService.back();
}
