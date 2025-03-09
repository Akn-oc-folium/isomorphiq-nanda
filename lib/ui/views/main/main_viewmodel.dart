import 'package:flutter/material.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/profile_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class MainViewModel extends IndexTrackingViewModel {
  final HiveService _hiveService = locator<HiveService>();
  final ApiService _apiService = locator<ApiService>();

  UserProfile? _userProfile;
  UserProfile? get uerProfile => _userProfile;

  Future<void> initialise() async {
    await _fetchUserProfile();
  }

  Future<void> _fetchUserProfile() async {
    setBusy(true);
    try {
      // Retrieve the previously stored user level.
      final storedUserLevel =
          await _hiveService.retrieveData(kUserBox, kUserLevelKey);
      final username = await _hiveService.retrieveData(kUserBox, kUsernameKey);

      // Fetch the latest user profile from the API.
      _userProfile = await _apiService.getDashboard(username: username!);
      final profileData = _userProfile!.data!;

      // Store the user ID if not already stored.
      if (!await _hiveService.containsKey(kUserBox, kUserIdKey)) {
        await _hiveService.storeData(kUserBox, kUserIdKey, profileData.id);
      }

      // If no level is stored or the fetched level is different, update it.
      if (storedUserLevel == null || storedUserLevel != profileData.level) {
        await _hiveService.storeData(
            kUserBox, kUserLevelKey, profileData.level);
        if (profileData.level! > 1) {
          await _hiveService.storeData(kUserBox, kPlayActiveKey, true);
        }
      }
      // If the play-active flag is not present and the user level is above 1,
      // ensure the play button is active.
      else if (!await _hiveService.containsKey(kUserBox, kPlayActiveKey) &&
          profileData.level! > 1) {
        await _hiveService.storeData(kUserBox, kPlayActiveKey, true);
      }
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    } finally {
      setBusy(false);
    }
  }
}
