import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/profile_model.dart';
import 'package:isomorph_iq/models/user_rank_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class EarnViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();

  final int _points = 1000;
  int get points => _points;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  UserRank? _userRank;
  UserRank? get userRank => _userRank;

  String? _username;
  String? get username => _username;

  List<bool> taskCompletionStatus = [false, false, false];

  bool get areAllTasksDone => taskCompletionStatus.every((status) => status);

  Future<void> initialise() async {
    await _fetchDashboard();
    await _fetchUserRank();
  }

  void markTaskAsDone(int index) {
    if (index >= 0 && index < taskCompletionStatus.length) {
      taskCompletionStatus[index] = true;
      notifyListeners();
    }
  }

  bool onClickStreakRedeem() => true;

  Future<void> _fetchDashboard() async {
    setBusy(true);
    _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
    try {
      _userProfile = await _apiService.getDashboard(username: username!);
      await _hiveService.storeData(kUserBox, kUserIdKey, _userProfile!.data.id);
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    }
  }

  Future<void> _fetchUserRank() async {
    try {
      _userRank = await _apiService.getUserRank(username: username!);
    } catch (e) {
      debugPrint('Error fetching user rank: $e');
    }
    setBusy(false);
  }
}
