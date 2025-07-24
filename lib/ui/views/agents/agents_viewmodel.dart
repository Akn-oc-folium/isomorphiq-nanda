import 'package:flutter/material.dart';
import 'package:isomorph_iq_nanda/app/app.locator.dart';
import 'package:isomorph_iq_nanda/app/app.router.dart';
import 'package:isomorph_iq_nanda/models/profile_model.dart';
import 'package:isomorph_iq_nanda/models/user_rank_model.dart';
import 'package:isomorph_iq_nanda/services/api_service.dart';
import 'package:isomorph_iq_nanda/services/hive_service.dart';
import 'package:isomorph_iq_nanda/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class AgentsViewModel extends BaseViewModel {
  final ApiService _apiService = locator<ApiService>();
  final HiveService _hiveService = locator<HiveService>();
  final RouterService _routerService = locator<RouterService>();
  final DialogService _dialogService = locator<DialogService>();
  final TelegramWebApp _telegramWebApp = TelegramWebApp.instance;

  DateTime? lastRedeemedDate;
  final int streakPoints = 50;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  int _totalEarned = 0;
  int get totalEarned => _totalEarned;

  UserRank? _userRank;
  UserRank? get userRank => _userRank;

  String? _username;

  Future<void> initialise() async {
    try {
      setBusy(true);
      _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
      if (_username == null) {
        var response = await _dialogService.showDialog(
          title: 'Error',
          description:
              "To get started, simply open the IsomorphIQ Bot's chat and send the '/start' command. This will activate the bot and unlock its features for you.",
          barrierDismissible: false,
        );
        if (response?.confirmed ?? false) {
          _telegramWebApp.close();
        }
        throw Exception("Username is null.");
      }
      await Future.wait([
        _loadRedeemStatus(),
        _fetchProfile(),
        _fetchUserRank(),
      ]);
    } catch (e) {
      debugPrint('Error during agent init: $e');
    } finally {
      setBusy(false);
    }
  }

  bool get isRedeemedToday {
    if (lastRedeemedDate == null) return false;
    final now = DateTime.now();
    return lastRedeemedDate!.year == now.year &&
        lastRedeemedDate!.month == now.month &&
        lastRedeemedDate!.day == now.day;
  }

  Future<void> _loadRedeemStatus() async {
    final storedDate =
        await _hiveService.retrieveData(kUserBox, kLastRedeemedKey);
    if (storedDate is String) {
      lastRedeemedDate = DateTime.tryParse(storedDate);
    }
    notifyListeners();
  }

  Future<void> onClickStreakRedeem() async {
    setBusyForObject("redeemingStreak", true);
    if (isRedeemedToday) return;

    _totalEarned += streakPoints;
    final storedUserId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    if (storedUserId != null) {
      await _apiService.postUserPoints(
          userId: storedUserId, points: streakPoints);
    }

    lastRedeemedDate = DateTime.now();
    await _hiveService.storeData(
        kUserBox, kLastRedeemedKey, lastRedeemedDate!.toIso8601String());

    setBusyForObject("redeemingStreak", false);
    notifyListeners();
  }

  Future<void> _fetchProfile() async {
    try {
      _userProfile = await _apiService.getDashboard(username: _username!);
      final userId = _userProfile?.data?.id;
      if (userId != null || userId!.isNotEmpty) {
        if (!await _hiveService.containsKey(kUserBox, kUserIdKey)) {
          await _hiveService.storeData(kUserBox, kUserIdKey, userId);
        }
        _totalEarned = _userProfile?.data?.points ?? 0;
      }
    } catch (e) {
      debugPrint('Error fetching agent profile: $e');
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

  void navigateToSources() => _routerService.navigateToSourcesView();
  void navigateToTweetPersona() => _routerService.navigateToAgentHomeView();
  void navigateToCryptoNews() => _routerService.navigateToCryptoNewsAgentView();
  void navigateToAgentSettings() => _routerService.navigateToAiPersonaView();
}
