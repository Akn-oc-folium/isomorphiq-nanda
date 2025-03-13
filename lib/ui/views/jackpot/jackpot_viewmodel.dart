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

class JackpotViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();
  final _routerService = locator<RouterService>();

  int? _userLevel;
  int? get userLevel => _userLevel;

  bool _playActive = false;
  bool get playActive => _playActive;

  Leaderboard? _leaderboard;
  Leaderboard get leaderboard => _leaderboard!;

  Future<void> refreshData() async {
    setBusy(true);
    try {
      await _fetchLeaderboard();
    } catch (e) {
      debugPrint('Error fetching leaderboard: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> _fetchLeaderboard() async {
    setBusy(true);
    _userLevel = await _hiveService.retrieveData(kUserBox, kUserLevelKey);
    try {
      // Read the play-active flag if the user level indicates eligibility.
      if (_userLevel != null && _userLevel! > 1) {
        final retrievePlayActiveStatus =
            await _hiveService.retrieveData(kUserBox, kPlayActiveKey);
        _playActive = retrievePlayActiveStatus ?? false;
      } else {
        _playActive = false;
      }

      _leaderboard = await _apiService.getLeaderboard();
    } catch (e) {
      debugPrint('Error fetching leaderboard: $e');
    } finally {
      setBusy(false);
    }
  }

  Future<void> initialise() async {
    await _fetchLeaderboard();
  }

  void enterPlayMode() {
    _routerService.navigateToPlayView();
  }
}
