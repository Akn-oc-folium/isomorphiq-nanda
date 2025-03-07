import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/app/app.router.dart';
import 'package:isomorph_iq/models/leaderboard_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:telegram_web_app/telegram_web_app.dart';

class JackpotViewModel extends BaseViewModel {
  final TelegramWebApp telegramWebApp = TelegramWebApp.instance;
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();
  final _routerService = locator<RouterService>();

  final bool _tgInitialized = false;
  bool get tgInitialized => _tgInitialized;

  String? _username;
  String get username => _username!;

  int? _userLevel;
  int? get userLevel => _userLevel;

  Leaderboard? _leaderboard;
  Leaderboard get leaderboard => _leaderboard!;

  Future<void> fetchLeaderboard() async {
    setBusy(true);
    _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
    _userLevel = await _hiveService.retrieveData(kUserBox, kUserLevelKey);
    try {
      _leaderboard = await _apiService.getLeaderboard();
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    }
    setBusy(false);
  }

  Future<void> initState() async {
    await fetchLeaderboard();
  }

  void enterPlayMode() {
    _routerService.navigateToPlayView();
  }
}
