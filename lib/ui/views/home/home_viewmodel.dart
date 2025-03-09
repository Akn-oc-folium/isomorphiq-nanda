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
import 'package:url_launcher_web/url_launcher_web.dart';

class HomeViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final HiveService _hiveService = locator<HiveService>();
  final RouterService _routerService = locator<RouterService>();
  final DialogService _dialogService = locator<DialogService>();

  DateTime? lastRedeemedDate;
  final int streakPoints = 50;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  int _totalEarned = 0;
  int get totalEarned => _totalEarned;

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
    await _loadRedeemStatus();
    await refreshData();
  }

  Future<void> refreshData() async {
    try {
      setBusy(true);
      _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
      if (_username == null) {
        await _dialogService.showDialog(
          title: 'Error',
          description:
              "To get started, simply open the IsomorphIQ Bot's chat and send the '/start' command. This will activate the bot and unlock its features for you.",
          barrierDismissible: false,
        );
        throw Exception("Username is null.");
      }
      await Future.wait([
        _loadRedeemStatus(),
        _fetchProfile(),
        _fetchUserRank(),
      ]);
    } catch (e) {
      debugPrint('Error refreshing data: $e');
    } finally {
      setBusy(false);
    }
    await fetchNews();
  }

  /// Returns true if the user has redeemed today.
  bool get isRedeemedToday {
    if (lastRedeemedDate == null) return false;
    final now = DateTime.now();
    return lastRedeemedDate!.year == now.year &&
        lastRedeemedDate!.month == now.month &&
        lastRedeemedDate!.day == now.day;
  }

  /// Load the stored redemption date from Hive.
  Future<void> _loadRedeemStatus() async {
    final storedDate =
        await _hiveService.retrieveData(kUserBox, klastRedeemedKey);
    if (storedDate is String) {
      lastRedeemedDate = DateTime.tryParse(storedDate);
    }
    notifyListeners();
  }

  Future<void> onClickStreakRedeem() async {
    setBusyForObject("redeemingStreak", true);
    if (isRedeemedToday) return; // Already redeemed today.

    _totalEarned += streakPoints;
    final storedUserId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    if (storedUserId != null) {
      await _apiService.postUserPoints(
          userId: storedUserId, points: streakPoints);
    }

    // Record that redemption happened now.
    lastRedeemedDate = DateTime.now();
    await _hiveService.storeData(
        kUserBox, klastRedeemedKey, lastRedeemedDate!.toIso8601String());

    setBusyForObject("redeemingStreak", false);
  }

  Future<void> _fetchProfile() async {
    if (_username == null) return;
    try {
      _userProfile = await _apiService.getDashboard(username: _username!);
      final userId = _userProfile?.data?.id;
      if (userId != null) {
        await _hiveService.storeData(kUserBox, kUserIdKey, userId);
      }

      final twitterAuthToken = _userProfile?.data?.twitterAuthToken ?? "";
      if (twitterAuthToken.isNotEmpty) {
        _xAuthTokenExists = true;
        final storedXToken =
            await _hiveService.retrieveData(kUserBox, kXTokenKey);
        if (storedXToken != twitterAuthToken) {
          await _hiveService.storeData(kUserBox, kXTokenKey, twitterAuthToken);
        }
      } else {
        _xAuthTokenExists = false;
        await _hiveService.removeData(kUserBox, kXTokenKey);
      }

      _tweetCount = await _hiveService.retrieveData(kUserBox, kTweetCountsKey);
      _totalEarned = _userProfile?.data?.points ?? 0;
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    }
  }

  Future<void> _fetchUserRank() async {
    if (_username == null) return;
    try {
      _userRank = await _apiService.getUserRank(username: _username!);
    } catch (e) {
      debugPrint('Error fetching user rank: $e');
    }
  }

  Future<void> fetchNews() async {
    setBusyForObject('fetchingNews', true);
    final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    try {
      final response = await _apiService.getCryptoNews(userId: userId);
      _newsList = response.data;
    } catch (e) {
      debugPrint("Error fetching news: $e");
    }
    setBusyForObject('fetchingNews', false);
  }

  void readMore(int index) {
    final url = _newsList?[index].source?.url;
    if (url != null) {
      UrlLauncherPlugin().launch(url, useWebView: true);
    }
  }

  Future<void> signout() async {
    await _hiveService.clearAllData();
    await _hiveService.closeAllBoxes();
    _routerService.replaceWithMainView();
  }

  void navigateToSources() => _routerService.navigateToSourcesView();
  void navigateToAiPersona() => _routerService.navigateToAiPersonaView();
  void navigateToTweetPersona() =>
      _routerService.navigateToTwitterPersonaView();
  void navigateToCryptoNews() => _routerService.navigateToCryptoNewsAgentView();
}
