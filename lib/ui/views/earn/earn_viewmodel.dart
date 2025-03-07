import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/models/crypto_news_model.dart';
import 'package:isomorph_iq/models/profile_model.dart';
import 'package:isomorph_iq/models/user_rank_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EarnViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();
  final _routerService = locator<RouterService>();

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  UserRank? _userRank;
  UserRank? get userRank => _userRank;

  bool _xAuthTokenExists = false;
  bool get xAuthTokenExists => _xAuthTokenExists;

  String? _username;
  String? get username => _username;

  int? _tweetCount;
  int? get tweetCount => _tweetCount;

  List<News>? _newsList;
  List<News>? get newsList => _newsList;

  Future<void> initialise() async {
    setBusy(true);
    _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
    await _fetchProfile();
    await _fetchUserRank();
    setBusy(false);
    await fetchNews();
  }

  bool onClickStreakRedeem() => true;

  Future<void> _fetchProfile() async {
    try {
      _userProfile = await _apiService.getDashboard(username: _username!);
      await _hiveService.storeData(
          kUserBox, kUserIdKey, _userProfile!.data!.id);
      if (_userProfile!.data!.twitterAuthToken != "") {
        _xAuthTokenExists = true;
      }
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    }
  }

  Future<void> _fetchUserRank() async {
    try {
      _userRank = await _apiService.getUserRank(username: _username!);
      if (_xAuthTokenExists) {
        _tweetCount =
            await _hiveService.retrieveData(kUserBox, kTweetCountsKey);
      }
    } catch (e) {
      debugPrint('Error fetching user rank: $e');
    }
  }

  Future<void> fetchNews() async {
    setBusyForObject('fetchingNews', true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getCryptoNews(
          userId: userId);
      _newsList = response.data;
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
    setBusyForObject('fetchingNews', false);
  }

  void navigateToSources() => _routerService.navigateToSourcesView();
  void navigateToAiPersona() => _routerService.navigateToAiPersonaView();
  void navigateToTweetPersona() =>
      _routerService.navigateToTwitterPersonaView();
  void navigateToCryptoNews() => _routerService.navigateToCryptoNewsAgentView();
}
