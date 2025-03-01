import 'package:flutter/widgets.dart';
import 'package:isomorph_iq/app/app.locator.dart';
import 'package:isomorph_iq/models/google_sign.dart';
import 'package:isomorph_iq/services/api_service.dart';
import 'package:isomorph_iq/services/authorization_service.dart';
import 'package:isomorph_iq/services/hive_service.dart';
import 'package:isomorph_iq/ui/common/app_constants.dart';
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

  Future<void> initialise() async {
    final savedState = await _hiveService.retrieveData(
        AppConstants.authBox, AppConstants.authKey);
    if (savedState != null) {
      connectedApps = Map<String, dynamic>.from(savedState).map((key, value) =>
          MapEntry(AuthProvider.values.firstWhere((e) => e.toString() == key),
              value));
      notifyListeners();
    }
  }

  /// Saves authentication state
  Future<void> _saveAuthState() async {
    await _hiveService.storeData(AppConstants.authBox, AppConstants.authKey,
        connectedApps.map((key, value) => MapEntry(key.toString(), value)));
  }

  // Fetches the authentication URL and initiates the authentication flow.
  Future<void> connectApp(AuthProvider provider) async {
    String appId = provider.name;
    String urlEndPoint = _getAuthUrlEndpoint(provider);

    // final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
    // debugPrint("User id is: $userId");
    try {
      loadingState[provider] = true;
      notifyListeners();

      // Fetch authentication URL from API
      SignAuth signAuth = await _apiService.getAppAuthUrl(
        appId: appId,
        userId: "5e906707-e316-40ab-8c17-b80b88167662",
        urlEndPoint: urlEndPoint,
      );

      // Initiate authentication process
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

  // Future<void> connectToGoogle() async {
  //   setBusy(true);
  //   final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
  //   debugPrint("User id is: $userId");
  //   try {
  //     debugPrint("User id inside try is: $userId");
  //     final authUrl = await _apiService.getGoogleAuthUrl(userId: userId);
  //     debugPrint("Auth link is: ${authUrl.data.link}");
  //     final popup = web.window.open(authUrl.data.link, 'GoogleAuth',
  //         'width=600,height=800,toolbar=no,location=no,status=no');

  //     // Listen for messages from the popup
  //     web.window.addEventListener('message', _handleMessage.toJS);

  //     // Fallback check if popup closed without completing
  //     Future.delayed(const Duration(minutes: 2), () {
  //       if (popup!.closed) {
  //         debugPrint('Authentication timed out');
  //         rebuildUi();
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint('Connection error: $e');
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  // Future<void> connectToDiscord() async {
  //   setBusy(true);
  //   final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
  //   try {
  //     debugPrint("User id inside try is: $userId");
  //     final authUrl = await _apiService.getDiscordAuthUrl(userId: userId);
  //     debugPrint("Auth link is: ${authUrl.data.link}");
  //     final popup = web.window.open(authUrl.data.link, 'DiscordAuth',
  //         'width=600,height=800,toolbar=no,location=no,status=no');

  //     // Listen for messages from the popup
  //     web.window.addEventListener('message', _handleMessage.toJS);

  //     // Fallback check if popup closed without completing
  //     Future.delayed(const Duration(minutes: 2), () {
  //       if (popup!.closed) {
  //         debugPrint('Authentication timed out');
  //         rebuildUi();
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint('Connection error: $e');
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  // Future<void> connectToX() async {
  //   setBusy(true);
  //   final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
  //   try {
  //     debugPrint("User id inside try is: $userId");
  //     final authUrl = await _apiService.getXAuthUrl(userId: userId);
  //     debugPrint("Auth link is: ${authUrl.data.link}");
  //     final popup = web.window.open(authUrl.data.link, 'TwitterAuth',
  //         'width=600,height=800,toolbar=no,location=no,status=no');

  //     // Listen for messages from the popup
  //     web.window.addEventListener('message', _handleMessage.toJS);

  //     // Fallback check if popup closed without completing
  //     Future.delayed(const Duration(minutes: 2), () {
  //       if (popup!.closed) {
  //         debugPrint('Authentication timed out');
  //         rebuildUi();
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint('Connection error: $e');
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  // Future<void> connectToFacebook() async {
  //   setBusy(true);
  //   final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
  //   try {
  //     debugPrint("User id inside try is: $userId");
  //     final authUrl = await _apiService.getFacebookAuthUrl(userId: userId);
  //     debugPrint("Auth link is: ${authUrl.data.link}");
  //     final popup = web.window.open(authUrl.data.link, 'FacebookAuth',
  //         'width=600,height=800,toolbar=no,location=no,status=no');

  //     // Listen for messages from the popup
  //     web.window.addEventListener('message', _handleMessage.toJS);

  //     // Fallback check if popup closed without completing
  //     Future.delayed(const Duration(minutes: 2), () {
  //       if (popup!.closed) {
  //         debugPrint('Authentication timed out');
  //         rebuildUi();
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint('Connection error: $e');
  //   } finally {
  //     setBusy(false);
  //   }
  // }

  // Future<void> connectToSpotify() async {
  //   setBusy(true);
  //   final userId = await _hiveService.retrieveData(kUserBox, kUserIdKey);
  //   try {
  //     debugPrint("User id inside try is: $userId");
  //     final authUrl = await _apiService.getSpotifyAuthUrl(userId: userId);
  //     debugPrint("Auth link is: ${authUrl.data.link}");
  //     final popup = web.window.open(authUrl.data.link, 'SpotifyAuth',
  //         'width=600,height=800,toolbar=no,location=no,status=no');

  //     // Listen for messages from the popup
  //     web.window.addEventListener('message', _handleMessage.toJS);

  //     // Fallback check if popup closed without completing
  //     Future.delayed(const Duration(minutes: 2), () {
  //       if (popup!.closed) {
  //         debugPrint('Authentication timed out');
  //         rebuildUi();
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint('Connection error: $e');
  //   } finally {
  //     setBusy(false);
  //   }
  // }
}
