import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/dashboard_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final _hiveService = locator<HiveService>();
  final _apiService = locator<ApiService>();

  Future<void> initialise() async {
    await _fetchUserProfile();
  }

  String? _username;
  String? get username => _username;

  UserProfile? _userProfile;
  UserProfile? get uerProfile => _userProfile;

  Future<void> _fetchUserProfile() async {
    setBusy(true);
    _username = await _hiveService.retrieveData(kUserBox, kUsernameKey);
    debugPrint('TG username is: $_username');
    try {
      _userProfile = await _apiService.getDashboard(username: username!);
      await _hiveService.storeData(kUserBox, kUserIdKey, _userProfile!.data.id);
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    }
    setBusy(false);
  }
}
