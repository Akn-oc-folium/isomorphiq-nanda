import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.bottomsheets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/models/fetch_tweets.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AgentsTwitterPersonaViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  List<Tweet> tweets = [];
  bool isFilterDropdownVisible = false;

  TextEditingController topicController = TextEditingController();

  List<String> filterOptions = ["Pending", "Approved", "Latest"];

  String selectedFilter = "Pending";

  late String generatedTweet;

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

  void fetchTweets() async {
    setBusy(true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.fetchTweets(
          userId: userId, tweetStatus: selectedFilter.toUpperCase());
      tweets = response.data;
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    }

    setBusy(false);
  }

  void generateTweetForTwitterPersona() async {
    setBusy(true);
    if (topicController.text.isNotEmpty) {
      try {
        final response = await _apiService.postGenerateTweet(
            userId: "cc23fa3d-beca-49db-8f04-1f0c6a8cbfec",
            topic: topicController.text.trim());

        generatedTweet = response.data.content;
        debugPrint("Generate tweet : $generatedTweet");
        topicController.clear();
        openGeneratedTweetModal();
      } catch (e) {
        debugPrint("Error fetching news: $e");
      }
    }
    setBusy(false);
  }

  void openGeneratedTweetModal() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.generatedTweet,
      barrierDismissible: false,
      title: 'Tweet you just generated',
      description: generatedTweet,
      isScrollControlled: true,
    );
  }

  void updateTweetStatus(String tweetId, String tweetStatus) async {
    try {
      final response = await _apiService.updateTweetStatus(
          userId: 'cc23fa3d-beca-49db-8f04-1f0c6a8cbfec',
          tweetId: tweetId,
          tweetStatus: tweetStatus);
      if (response.code == 200) {
        fetchTweets();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error fetching tweets: $e');
    }
  }

  void navigateToSettings() {
    _routerService.navigateToTweetSettingsView();
  }

  void navigateBack() {
    _routerService.back();
  }
}
