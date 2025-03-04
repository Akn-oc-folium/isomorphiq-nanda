import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/app_connections_model.dart';
import 'package:isomorph_iq/models/google_sign.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/authorization_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
import 'package:isomorph_iq/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

enum AuthProvider { google, telegram, x, discord, facebook, spotify, reddit }

class SourcesViewModel extends BaseViewModel {
  final _apiService = locator<ApiService>();
  final _hiveService = locator<HiveService>();
  final AuthorizationService _authService = locator<AuthorizationService>();

  // Track connection status
  Map<AuthProvider, bool> connectedApps = {
    AuthProvider.google: false,
    AuthProvider.telegram: true,
    AuthProvider.x: false,
    AuthProvider.discord: false,
    AuthProvider.facebook: false,
    AuthProvider.spotify: false,
    AuthProvider.reddit: false,
  };

  /// Tracks loading state per app
  Map<AuthProvider, bool> loadingState = {
    AuthProvider.google: false,
    AuthProvider.telegram: false,
    AuthProvider.x: false,
    AuthProvider.discord: false,
    AuthProvider.facebook: false,
    AuthProvider.spotify: false,
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

  Future<void> _saveAuthState() async {
    await _hiveService.storeData(
      AppConstants.authBox,
      AppConstants.authKey,
      connectedApps.map((key, value) => MapEntry(key.toString(), value)),
    );
  }

  Future<void> connectApp(AuthProvider provider) async {
    String appId = provider.name;
    String urlEndPoint = _getAuthUrlEndpoint(provider);

    try {
      loadingState[provider] = true;
      notifyListeners();

      SignAuth signAuth = await _apiService.getAppAuthUrl(
        appId: appId,
        userId: userId!, // "ff8bbd4e-6221-48a4-910f-b88c4978c5d5",
        urlEndPoint: urlEndPoint,
      );

      bool success = await _authService.authenticate(signAuth.data.link);

      if (success) {
        connectedApps[provider] = true;
        await _saveAuthState();
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error: $e"); // Replace with error UI handling
    } finally {
      loadingState[provider] = false; // Stop loading
      notifyListeners();
    }
  }

  /// Replace with actual API endpoints
  String _getAuthUrlEndpoint(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.google:
        return AppConstants.googleEndpoint;
      case AuthProvider.x:
        return AppConstants.xEndpoint;
      case AuthProvider.discord:
        return AppConstants.discordEndpoint;
      case AuthProvider.facebook:
        return AppConstants.facebookEndpoint;
      case AuthProvider.spotify:
        return AppConstants.spotifyEndpoint;
      case AuthProvider.reddit:
        return AppConstants.redditEndpoint;
      default:
        return "";
    }
  }

  Future<void> _fetchConnections() async {
    setBusy(true);
    try {
      _appConnections = await _apiService.getAppConnections(userId: userId!);
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching dashboard: $e');
    } finally {
      setBusy(false);
    }
  }
}
