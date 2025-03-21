import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.bottomsheets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/app_connections_model.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
extension AuthProviderExtension on AuthProvider {
  String get title {
    switch (this) {
      case AuthProvider.google:
        return "Google";
      case AuthProvider.telegram:
        return "Telegram";
      case AuthProvider.x:
        return "X";
      case AuthProvider.discord:
        return "Discord";
      case AuthProvider.facebook:
        return "Facebook";
      // case AuthProvider.spotify:
      //   return "Spotify";
      case AuthProvider.reddit:
        return "Reddit";
    }
  }
}

class SourcesViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();
  final _bottomSheetService = locator<BottomSheetService>();

  // Track connection status
  Map<AuthProvider, bool> connectedApps = {
    AuthProvider.google: false,
    AuthProvider.telegram: true,
    AuthProvider.x: false,
    AuthProvider.discord: false,
    AuthProvider.facebook: false,
    // AuthProvider.spotify: false,
    AuthProvider.reddit: false,
  };

  /// Tracks loading state per app
  Map<AuthProvider, bool> loadingState = {
    AuthProvider.google: false,
    AuthProvider.telegram: false,
    AuthProvider.x: false,
    AuthProvider.discord: false,
    AuthProvider.facebook: false,
    // AuthProvider.spotify: false,
    AuthProvider.reddit: false,
  };

  String? _userId;
  String? get userId => _userId;

  AppConnections? _appConnections;
  AppConnections? get appConnections => _appConnections;

  Future<void> initialise() async {
    final savedState = await _hiveService.retrieveData(
        AppConstants.authBox, AppConstants.authKey);
    if (savedState != null) {
      connectedApps = Map<String, dynamic>.from(savedState).map(
        (key, value) => MapEntry(
            AuthProvider.values.firstWhere((e) => e.toString() == key), value),
      );
      notifyListeners();
    }

    _userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    await _fetchConnections();
  }

  void connectApp(AuthProvider provider) async {
    try {
      loadingState[provider] = true;
      notifyListeners();

      var response = await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.connectApp,
        barrierDismissible: false,
        title: provider.title,
        data: {
          provider: provider,
          userId: userId,
        },
        isScrollControlled: true,
      );

      if (response?.confirmed ?? false) {
        await _fetchConnections();
      }
    } finally {
      loadingState[provider] = false;
      notifyListeners();
    }
  }

  Future<void> _fetchConnections() async {
    setBusy(true);
    try {
      _appConnections = await _apiService.getAppConnections(userId: userId!);
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    } finally {
      setBusy(false);
    }
  }
}
